import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

import 'package:flutter__first_app/data/models/chapter.dart';
import 'package:flutter__first_app/data/models/novel.dart';
import 'package:flutter__first_app/data/scrapers/base_scraper.dart';

class LacCaTruyenScraper extends BaseScraper {
  @override
  String get domain => 'lacatruyen.vip';

  @override
  Future<Novel> getNovelDetail(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);

      String title = document.querySelector('h1.story_hero-title__8zfaW')?.text.trim() ??
          document.querySelector('h1')?.text.trim() ?? 'Không rõ tên';

      String author = document
              .querySelector('.story_hero-meta__gJp_B a[href*="/user/profile/"]')
              ?.text.trim() ??
          'Không rõ tác giả';

      String coverUrl = '';
      String rawSrc = document
              .querySelector('.story_hero-cover__YAAEy img')
              ?.attributes['src'] ?? '';
      if (rawSrc.isNotEmpty) {
        coverUrl = rawSrc.contains('/_next/image')
            ? (Uri.parse(rawSrc).queryParameters['url'] ?? rawSrc)
            : (rawSrc.startsWith('http') ? rawSrc : 'https://$domain$rawSrc');
      }

      return Novel(
        title: title,
        author: author,
        coverUrl: coverUrl,
        sourceUrl: url,
        domain: this.domain,
      );
    } else {
      throw Exception('Lỗi mạng khi tải chi tiết truyện từ $domain');
    }
  } catch (e) {
    throw Exception('Xảy ra lỗi khi cào nội dung chi tiết: $e');
  }
}
  
  @override
  Stream<List<Chapter>> streamChapterPages(String url) async* {
    String? currentUrl = url;
    int currentIndex = 1;

    while (currentUrl != null && currentUrl.isNotEmpty) {
      print('Đang stream danh sách chương tại: $currentUrl');

      try {
        final response = await http.get(Uri.parse(currentUrl));
        if (response.statusCode != 200) break;

        var document = parser.parse(response.body);

        // Thường truyenhay dùng list-chapter hoặc #chapters-container
        var chapterElements = document.querySelectorAll('#chapters-container a.chapter-item');
        if (chapterElements.isEmpty) {
          chapterElements = document.querySelectorAll('#chapters-container a');
        }
        if (chapterElements.isEmpty) {
          chapterElements = document.querySelectorAll('a.chapter-item');
        }
        if (chapterElements.isEmpty) {
          chapterElements = document.querySelectorAll('ul.list-chapter li a');
        }
        if (chapterElements.isEmpty) {
          chapterElements = document.querySelectorAll('.list-chapter li a');
        }

        List<Chapter> pageChapters = [];

        for (var element in chapterElements.reversed) {
          String chapterLink = element.attributes['href'] ?? '';
          if (chapterLink.isNotEmpty) {
            if (!chapterLink.startsWith('http')) {
              chapterLink = chapterLink.startsWith('/')
                  ? 'https://$domain$chapterLink'
                  : 'https://$domain/$chapterLink';
            }

            String title = '';
            var titleSpan = element.querySelector('.text-emerald-400');
            var subtitleSpan = element.querySelector('.text-gray-400');

            if (titleSpan != null && subtitleSpan != null) {
              String mainTitle = titleSpan.text.trim();
              String subTitle = subtitleSpan.text.trim();
              if (subTitle.isNotEmpty && subTitle != 'Chưa có tiêu đề') {
                title = '$mainTitle: $subTitle';
              } else {
                title = mainTitle;
              }
            } else {
              title = element.text.trim().replaceAll(RegExp(r'\s+'), ' ');
            }

            pageChapters.add(Chapter(
              index: currentIndex,
              title: title,
              url: chapterLink,
            ));
            currentIndex++;
          }
        }

        if (pageChapters.isNotEmpty) {
          yield pageChapters;
        }

        // Tìm trang tiếp theo
        var nextPageElement = document.querySelector('a[rel="next"]');
        if (nextPageElement == null) {
          var paginationLinks = document.querySelectorAll('ul.pagination a, .pagination a');
          for (var link in paginationLinks) {
            if (link.text.trim().toLowerCase().contains('tiếp') || link.text.trim().contains('>')) {
              nextPageElement = link;
              break;
            }
          }
        }

        if (nextPageElement != null) {
          currentUrl = nextPageElement.attributes['href'];
          // Đảm bảo url là tuyệt đối
          if (currentUrl != null && !currentUrl.startsWith('http')) {
            currentUrl = 'https://$domain$currentUrl';
          }
          await Future.delayed(const Duration(milliseconds: 500));
        } else {
          currentUrl = null;
        }
      } catch (e) {
        print('Lỗi Stream danh sách chương: $e');
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

        // TruyenHay thường dùng #chapter-c hoặc .chapter-c, mới nhất dùng #chapter-content / .chapter-content
        var contentElement = document.querySelector('#chapter-content') ??
            document.querySelector('.chapter-content') ??
            document.querySelector('#chapter-article') ??
            document.querySelector('.reader-card') ??
            document.querySelector('#chapter-c') ??
            document.querySelector('.chapter-c');

        if (contentElement != null) {
          String rawHtml = contentElement.innerHtml;

          rawHtml = rawHtml.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n\n');
          rawHtml = rawHtml.replaceAll(RegExp(r'</p>', caseSensitive: false), '\n\n');

          var cleanedFragment = parser.parseFragment(rawHtml);
          String chapterText = cleanedFragment.text ?? '';

          chapterText = chapterText.split('\n').map((l) => l.trim()).join('\n');
          chapterText = chapterText.replaceAll(RegExp(r'\n{3,}'), '\n\n');

          return chapterText.trim();
        } else {
          throw Exception('Không tìm thấy nội dung chương trên truyenhay.app.');
        }
      } else {
        throw Exception('Lỗi mạng: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi cào dữ liệu nội dung: $e');
    }
  }
}