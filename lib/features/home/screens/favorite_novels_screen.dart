import 'package:flutter/material.dart';
import '../../../data/local_database/isar_models.dart';
import '../../../data/local_database/isar_service.dart';
import '../../offline_reader/screens/offline_novel_detail_screen.dart';

class FavoriteNovelsScreen extends StatefulWidget {
  const FavoriteNovelsScreen({super.key});

  @override
  State<FavoriteNovelsScreen> createState() => _FavoriteNovelsScreenState();
}

class _FavoriteNovelsScreenState extends State<FavoriteNovelsScreen> {
  List<NovelLocal> _novels = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _isLoading = true);
    final data = await IsarService().getFavoriteNovels();
    setState(() {
      _novels = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Truyện của tôi', style: TextStyle(fontWeight: FontWeight.bold))),
      body: RefreshIndicator(
        onRefresh: _loadFavorites,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _novels.isEmpty
            ? Stack(
          children: [
            ListView(),
            const Center(child: Text('Bạn chưa đánh dấu truyện nào.\nHãy vào chi tiết truyện và bấm nút (+)')),
          ],
        )
            : ListView.builder(
          itemCount: _novels.length,
          itemBuilder: (context, index) {
            final novel = _novels[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ListTile(
                leading: novel.coverUrl.isNotEmpty
                    ? Image.network(novel.coverUrl, width: 40, height: 60, fit: BoxFit.cover)
                    : const Icon(Icons.book, size: 40),
                title: Text(novel.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Đang đọc: Chương ${novel.lastReadChapterIndex}'),
                trailing: const Icon(Icons.favorite, color: Colors.red, size: 20),
                onTap: () async {
                  await IsarService().updateLastAccessed(novel.sourceUrl);
                  if (mounted) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OfflineNovelDetailScreen(novelUrl: novel.sourceUrl),
                    )).then((_) => _loadFavorites()); // Reload khi quay lại đề phòng user bấm (-) bỏ yêu thích
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}