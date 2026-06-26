import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter__first_app/data/scrapers/base_scraper.dart';
import 'package:flutter__first_app/data/scrapers/metruyenchu_scraper.dart';
import 'package:flutter__first_app/data/scrapers/truyenhay_scraper.dart';
import 'package:flutter__first_app/features/novel_detail/screens/chapter_list_screen.dart';
import 'web_browser_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/novel.dart';
import '../../../data/scrapers/truyenfull_scraper.dart';

class SourceDetailScreen extends StatefulWidget {
  final String sourceName;
  final String domain;

  const SourceDetailScreen({
    super.key,
    required this.sourceName,
    required this.domain,
  });

  @override
  State<SourceDetailScreen> createState() => _SourceDetailScreenState();
}

class _SourceDetailScreenState extends State<SourceDetailScreen> {
  final TextEditingController _urlController = TextEditingController();
  bool _isLoading = false;

  // HÀM MỞ TRÌNH DUYỆT TRONG APP
  Future<void> _openInAppBrowser() async {
    final String initialUrl = 'https://${widget.domain}';
    final String? selectedUrl = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => WebBrowserScreen(initialUrl: initialUrl),
      ),
    );

    if (selectedUrl != null && selectedUrl.isNotEmpty) {
      setState(() {
        _urlController.text = selectedUrl;
      });
    }
  }

  // HÀM CÀO VÀ LƯU LÊN FIREBASE
  Future<void> _fetchAndSaveNovel() async {
    String url = _urlController.text.trim();
    if (url.isEmpty || !url.contains(widget.domain)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Link không hợp lệ với nguồn này!')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // --- LOGIC 1: KIỂM TRA TRÙNG LẶP TRONG FIREBASE ---
      final checkExist = await FirebaseFirestore.instance
          .collection('novels')
          .where('sourceUrl', isEqualTo: url)
          .get();

      if (checkExist.docs.isNotEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Truyện này đã được thêm vào thư viện từ trước!'),
            ),
          );
        }
        setState(() => _isLoading = false);
        return; // Dừng luôn, không cào nữa
      }

      // --- LOGIC 2: CHỌN ĐÚNG CÔNG CỤ CÀO DỮ LIỆU ---
      BaseScraper
      scraper; // Đảm bảo bạn đã import BaseScraper, TruyenFullScraper, MetruyenchuScraper ở đầu file
      if (url.contains('truyenfull.today')) {
        scraper = TruyenFullScraper();
      } else if (url.contains('metruyenchuvn.com')) {
        scraper = MetruyenchuScraper();
      } else if (url.contains('truyenhay.app')) {
        scraper = TruyenHayScraper();
      } else {
        throw Exception('Chưa hỗ trợ cào trang web này!');
      }

      // --- THỰC THI CÀO VÀ LƯU ---
      Novel newNovel = await scraper.getNovelDetail(url);
      await FirebaseFirestore.instance
          .collection('novels')
          .add(newNovel.toMap());

      if (mounted) {
        Navigator.pop(context); // Đóng hộp thoại
        _urlController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã thêm truyện thành công!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // GIAO DIỆN HỘP THOẠI THÊM TRUYỆN (BottomSheet)
  void _showAddNovelModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: _openInAppBrowser,
                onLongPress: () async {
                  await Clipboard.setData(ClipboardData(text: 'https://${widget.domain}'));
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Đã sao chép link nguồn: https://${widget.domain}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.travel_explore),
                label: const Text('Mở Web để tìm truyện'),
                style: ElevatedButton.styleFrom(
                  // ĐÃ FIX LỖI Ở ĐÂY: Thay Size.infinity thành Size(double.infinity, 50) và bỏ dấu ) thừa
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'HOẶC',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  labelText: 'Dán Link truyện vào đây',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.link),
                ),
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _fetchAndSaveNovel,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                          double.infinity,
                          50,
                        ), // ĐÃ FIX LỖI TƯƠNG TỰ Ở ĐÂY
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Cào & Lưu Truyện'),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sourceName)),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNovelModal,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('novels')
            .where('domain', isEqualTo: widget.domain)
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Đã xảy ra lỗi kết nối Firebase'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;
          if (docs.isEmpty) {
            return const Center(
              child: Text('Chưa có truyện nào. Bấm + để thêm.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final novelData = docs[index].data() as Map<String, dynamic>;
              final novel = Novel.fromMap(novelData);

              return Card(
                child: ListTile(
                  leading: novel.coverUrl.isNotEmpty
                      ? Image.network(
                          novel.coverUrl.startsWith('http')
                              ? novel.coverUrl
                              : 'https://${novel.domain}${novel.coverUrl}',
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => const Icon(Icons.book),
                        )
                      : const Icon(Icons.book),
                  title: Text(
                    novel.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(novel.author),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChapterListScreen(novel: novel),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
