import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

import 'base_scraper.dart';
import '../models/novel.dart';
import '../models/chapter.dart';

class TruyenFullScraper extends BaseScraper {
  @override
  String get domain => 'truyenfull.today';

  @override
  Future<Novel> getNovelDetail(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var document = parser.parse(response.body);

        String title = document.querySelector('h3.title')?.text.trim() ?? 'Không rõ tên';
        String author = document.querySelector('a[itemprop="author"]')?.text.trim() ?? 'Không rõ tác giả';

        // Lấy link ảnh bìa
        String coverUrl = document.querySelector('.book img')?.attributes['src'] ?? '';

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
      throw Exception('Xảy ra lỗi khi cào nội dung chi tiết: $e');
    }
  }

  @override
  Stream<List<Chapter>> streamChapterPages(String url) async* { // Chú ý có dấu *
    String? currentUrl = url;
    int currentIndex = 1;

    while (currentUrl != null && currentUrl.isNotEmpty) {
      print('Đang stream danh sách chương tại: $currentUrl');

      try {
        final response = await http.get(Uri.parse(currentUrl));
        if (response.statusCode != 200) break;

        var document = parser.parse(response.body);
        var chapterElements = document.querySelectorAll('ul.list-chapter li a');

        List<Chapter> pageChapters = []; // Chứa các chương của TRANG NÀY

        for (var element in chapterElements) {
          String chapterLink = element.attributes['href'] ?? '';
          if (chapterLink.isNotEmpty) {
            pageChapters.add(Chapter(
              index: currentIndex,
              title: element.text.trim(),
              url: chapterLink,
            ));
            currentIndex++;
          }
        }

        // BẮN DỮ LIỆU CỦA TRANG NÀY VỀ CHO UI NGAY LẬP TỨC
        if (pageChapters.isNotEmpty) {
          yield pageChapters;
        }

        // Logic tìm trang tiếp theo (giữ nguyên)
        var nextPageElement = document.querySelector('a[rel="next"]');
        if (nextPageElement == null) {
          var paginationLinks = document.querySelectorAll('ul.pagination a, .pagination a');
          for (var link in paginationLinks) {
            if (link.text.trim().toLowerCase().contains('trang tiếp')) {
              nextPageElement = link;
              break;
            }
          }
        }

        if (nextPageElement != null) {
          currentUrl = nextPageElement.attributes['href'];
          await Future.delayed(const Duration(milliseconds: 500)); // Tránh block IP
        } else {
          currentUrl = null;
        }
      } catch (e) {
        print('Lỗi Stream: $e');
        break;
      }
    }
  }

  @override
  Future<String> getChapterContent(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var document = parser.parse(response.body);
        var contentElement = document.querySelector('#chapter-c') ?? document.querySelector('.chapter-c');

        if (contentElement != null) {
          String rawHtml = contentElement.innerHtml;

          // BƯỚC QUAN TRỌNG: Đổi <br> và </p> thành \n\n (2 lần xuống dòng để tạo khe hở)
          rawHtml = rawHtml.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n\n');
          rawHtml = rawHtml.replaceAll(RegExp(r'</p>', caseSensitive: false), '\n\n');

          // Parse lại để bỏ các thẻ HTML rác (như quảng cáo, div, span...)
          var cleanedFragment = parser.parseFragment(rawHtml);
          String chapterText = cleanedFragment.text ?? '';

          // Dọn dẹp khoảng trắng thừa ở ĐẦU và CUỐI mỗi dòng, nhưng GIỮ LẠI các dấu \n
          chapterText = chapterText.split('\n').map((l) => l.trim()).join('\n');

          // Gộp nhiều dấu xuống dòng (3 dòng trở lên) thành đúng 2 dòng (\n\n) để cách đoạn đẹp mắt
          chapterText = chapterText.replaceAll(RegExp(r'\n{3,}'), '\n\n');

          return chapterText.trim(); // Trả về nội dung chữ cực kỳ sạch sẽ
        } else {
          throw Exception('Không tìm thấy nội dung chương.');
        }
      } else {
        throw Exception('Lỗi mạng: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi cào dữ liệu: $e');
    }
  }


}