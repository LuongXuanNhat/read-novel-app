import '../models/novel.dart';
import '../models/chapter.dart';

abstract class BaseScraper {
  String get domain;

  // 3 hàm bắt buộc mọi Scraper phải có
  Future<Novel> getNovelDetail(String url);
  Stream<List<Chapter>> streamChapterPages(String url);
  Future<String> getChapterContent(String url);
}