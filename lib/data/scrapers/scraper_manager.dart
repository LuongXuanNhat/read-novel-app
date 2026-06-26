import 'package:flutter__first_app/data/scrapers/base_scraper.dart';
import 'package:flutter__first_app/data/scrapers/metruyenchu_scraper.dart';
import 'package:flutter__first_app/data/scrapers/truyenfull_scraper.dart';

class ScraperManager {
  static final List<BaseScraper> _scrapers = [
    TruyenFullScraper(),
    MetruyenchuScraper(),

  ];

  // Hàm này sẽ tự động chọn đúng Scraper dựa vào Link user dán vào
  static BaseScraper getScraperForUrl(String url) {
    for (var scraper in _scrapers) {
      if (url.contains(scraper.domain)) {
        return scraper; // Trả về đúng tool cào của web đó
      }
    }
    throw Exception('Website này chưa được hỗ trợ!');
  }
}