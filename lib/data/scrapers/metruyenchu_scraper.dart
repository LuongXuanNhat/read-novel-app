import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';
import 'package:flutter__first_app/data/models/chapter.dart';
import 'package:flutter__first_app/data/models/novel.dart';
import 'package:flutter__first_app/data/scrapers/base_scraper.dart';

class MetruyenchuScraper extends BaseScraper {
  static const Map<String, String> _headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
  };

  static const Map<String, String> _ajaxHeaders = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
    'X-Requested-With': 'XMLHttpRequest',
  };

  @override
  String get domain => 'metruyenchuvn.com';

  String _absoluteUrl(String href) {
    if (href.startsWith('http')) return href;
    final path = href.startsWith('/') ? href.substring(1) : href;
    return 'https://$domain/$path';
  }

  @override
  Future<Novel> getNovelDetail(String url) async {
    try {
      final response = await http.get(Uri.parse(url), headers: _headers);

      if (response.statusCode == 200) {
        var document = parser.parse(response.body);

        String title = document.querySelector('h1')?.text.trim() ?? 'Không rõ tên';

        var authorElement = document.querySelector('a[href*="/tac-gia/"]');
        String author = authorElement?.text.trim() ?? 'Không rõ tác giả';

        var imgElement = document.querySelector('.nh-thumb img') ?? document.querySelector('img[alt="$title"]');

        String coverUrl = '';
        if (imgElement != null) {
          coverUrl = imgElement.attributes['data-src'] ?? imgElement.attributes['src'] ?? '';
        }

        return Novel(
          title: title,
          author: author,
          coverUrl: coverUrl,
          sourceUrl: url,
          domain: this.domain,
        );
      } else {
        throw Exception('Lỗi mạng khi tải chi tiết truyện');
      }
    } catch (e) {
      throw Exception('Xảy ra lỗi khi cào: $e');
    }
  }

  /// 1) ~100 chương đầu lấy thẳng từ #chapter-list (đã có sẵn trong HTML tĩnh).
  /// 2) Đọc bookId + tổng số trang từ onclick="page(bookId, totalPages)" của
  ///    nút "Cuối" trong thanh phân trang.
  /// 3) Gọi AJAX https://metruyenchuvn.com/get/listchap/{bookId}?page=N cho
  ///    từng trang còn lại để lấy hết phần chương phía sau.
  @override
  Stream<List<Chapter>> streamChapterPages(String url) async* {
    print('MTC - BẮT ĐẦU KẾT NỐI: $url');
    final response = await http.get(Uri.parse(url), headers: _headers);

    if (response.statusCode != 200) {
      throw Exception('Lỗi mạng khi tải trang truyện');
    }
    var document = parser.parse(response.body);

    int currentIndex = 1;
    List<Chapter> batch = [];

    // --- HÀM THÊM CHƯƠNG (ĐÃ THÊM LƯỚI LỌC RÁC) ---
    void addChapterFromAnchor(dom.Element a) {
      final href = a.attributes['href'];
      final text = a.text.trim();

      if (href == null || href.isEmpty) return;

      // LỌC RÁC: Bỏ qua các thẻ <a> là nút phân trang (1, 2, Cuối, Tiếp...)
      // Đặc điểm: Link chương truyện MTC thường luôn chứa chữ "chuong" hoặc "chap"
      if (!href.toLowerCase().contains('chuong') && !href.toLowerCase().contains('chap')) {
        return; // Bỏ qua không nhét vào mảng
      }

      batch.add(Chapter(
        index: currentIndex,
        title: text,
        url: _absoluteUrl(href),
      ));
      currentIndex++;
    }

    // --- 1) ~100 chương đầu từ HTML tĩnh ---
    var chapterListContainer = document.querySelector('#chapter-list');
    if (chapterListContainer != null) {
      for (var a in chapterListContainer.querySelectorAll('a')) {
        addChapterFromAnchor(a);
      }
    }

    if (batch.isEmpty) {
      print('MTC - #chapter-list trống hoặc không tồn tại tại: $url');
    } else {
      yield batch;
      batch = []; // Reset mảng để hứng đợt AJAX tiếp theo
    }

    // --- 2) Tìm bookId + tổng số trang từ nút "Cuối" ---
    final pagingPattern = RegExp(r'page\(\s*(\d+)\s*,\s*(\d+)\s*\)');
    int? bookId;
    int totalPages = 1;

    for (var a in document.querySelectorAll('a[onclick]')) {
      final onclick = a.attributes['onclick'];
      if (onclick == null) continue;
      final match = pagingPattern.firstMatch(onclick);
      if (match == null) continue;

      final id = int.tryParse(match.group(1)!);
      final page = int.tryParse(match.group(2)!) ?? 1;
      if (id == null) continue;

      final text = a.text.trim().toLowerCase();
      if (text.contains('cuối')) {
        bookId = id;
        totalPages = page;
        break;
      }

      bookId ??= id;
      if (page > totalPages) totalPages = page;
    }

    if (bookId == null || totalPages <= 1) {
      print('MTC - Không tìm thấy phân trang. Truyện có 1 trang.');
      return;
    }

    // --- 3) Gọi AJAX xử lý JSON (ĐÃ FIX LỖI TẠI ĐÂY) ---
    for (int page = 2; page <= totalPages; page++) {
      final ajaxUrl = 'https://$domain/get/listchap/$bookId?page=$page';
      try {
        final res = await http.get(Uri.parse(ajaxUrl), headers: _ajaxHeaders);
        if (res.statusCode != 200) {
          print('MTC - Lỗi AJAX trang $page (status ${res.statusCode})');
          continue;
        }

        // MA THUẬT NẰM Ở ĐÂY: Chuyển text thành JSON Object
        var jsonData = jsonDecode(res.body);

        // Móc lấy chuỗi HTML bên trong field "data"
        String htmlData = jsonData['data'] ?? '';

        // Dùng thư viện HTML bóc tách chuỗi vừa lấy được
        var fragment = parser.parseFragment(htmlData);
        for (var a in fragment.querySelectorAll('a')) {
          addChapterFromAnchor(a);
        }

        if (batch.isNotEmpty) {
          yield batch; // Bắn dữ liệu lên UI
          batch = [];  // Reset lại
        } else {
          print('MTC - Trang $page xử lý xong nhưng không có chương nào.');
        }

        await Future.delayed(const Duration(milliseconds: 400));
      } catch (e) {
        print('MTC - Lỗi khi bóc JSON trang $page: $e');
      }
    }
  }

  @override
  Future<String> getChapterContent(String url) async {
    try {
      final response = await http.get(Uri.parse(url), headers: _headers);

      if (response.statusCode == 200) {
        var document = parser.parse(response.body);

        var contentElement = document.querySelector('.truyen') ??
            document.querySelector('#chapter-detail') ??
            document.querySelector('.chapter-detail') ??
            document.querySelector('#article') ??
            document.querySelector('.chapter-content') ??
            document.querySelector('.content') ??
            document.querySelector('#chapter-c');

        if (contentElement != null) {
          String rawHtml = contentElement.innerHtml;

          rawHtml = rawHtml.replaceAll(RegExp(r'<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>'), '');
          rawHtml = rawHtml.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n\n');
          rawHtml = rawHtml.replaceAll(RegExp(r'</p>', caseSensitive: false), '\n\n');

          var cleanedFragment = parser.parseFragment(rawHtml);
          String chapterText = cleanedFragment.text ?? '';

          chapterText = chapterText.split('\n').map((l) => l.trim()).join('\n');
          chapterText = chapterText.replaceAll(RegExp(r'\n{3,}'), '\n\n');

          return chapterText.trim();
        } else {
          throw Exception('Không tìm thấy khối nội dung chữ trên web Metruyenchu.');
        }
      } else {
        throw Exception('Lỗi mạng MTC: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi cào nội dung MTC: $e');
    }
  }
}