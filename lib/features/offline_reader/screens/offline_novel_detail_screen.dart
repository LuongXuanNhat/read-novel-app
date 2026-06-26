import 'package:flutter/material.dart';
import '../../../data/local_database/isar_models.dart';
import '../../../data/local_database/isar_service.dart';
import 'offline_reader_screen.dart';

class OfflineNovelDetailScreen extends StatefulWidget {
  final String novelUrl;

  const OfflineNovelDetailScreen({super.key, required this.novelUrl});

  @override
  State<OfflineNovelDetailScreen> createState() =>
      _OfflineNovelDetailScreenState();
}

class _OfflineNovelDetailScreenState extends State<OfflineNovelDetailScreen> {
  NovelLocal? _novel;
  List<ChapterLocal> _chapters = [];
  bool _isLoading = true;
  String _coverUrl = '';
  bool _isFavorite = false; // Quản lý trạng thái nút bấm

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = IsarService();
    // 1. Lấy thông tin truyện
    final novels = await db.getDownloadedNovels();
    _novel = novels.firstWhere((n) => n.sourceUrl == widget.novelUrl);
    _coverUrl = _novel!.coverUrl.isNotEmpty
        ? (_novel!.coverUrl.startsWith('http')
              ? _novel!.coverUrl
              : 'https://${_novel!.domain}${_novel!.coverUrl}')
        : '';
    // Đọc trạng thái yêu thích từ DB
    _isFavorite = _novel!.isFavorite;

    // 2. Lấy danh sách chương đã tải
    _chapters = await db.getDownloadedChapters(widget.novelUrl);
    print('Số chương nội dung: ${_chapters.length}');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (_novel == null)
      return const Scaffold(
        body: Center(child: Text('Lỗi: Không tìm thấy truyện')),
      );

    return Scaffold(
      appBar: AppBar(
        // FIX LỖI 1: Cắt ngắn tên truyện trên AppBar nếu quá dài
        title: Text(
          _novel!.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.remove_circle : Icons.add_circle,
              color: _isFavorite ? Colors.red : Colors.grey.shade700,
            ),
            onPressed: () async {
              bool newState = !_isFavorite;
              await IsarService().toggleFavorite(widget.novelUrl, newState);
              setState(() => _isFavorite = newState);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      newState
                          ? 'Đã thêm vào Truyện của tôi'
                          : 'Đã bỏ khỏi Truyện của tôi',
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            },
          ),
        ],
      ),
      // BỌC TẤT CẢ TRONG COLUMN CHÍNH
      body: Column(
        children: [
          // KHỐI 1: THÔNG TIN TRUYỆN VÀ NÚT BẤM
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ảnh bìa
                _novel!.coverUrl.isNotEmpty
                    ? Image.network(
                        _coverUrl,
                        width: 100,
                        height: 140,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Container(
                          width: 100,
                          height: 140,
                          color: Colors.grey,
                          child: const Icon(Icons.book),
                        ),
                      )
                    : Container(
                        width: 100,
                        height: 140,
                        color: Colors.grey,
                        child: const Icon(Icons.book),
                      ),

                const SizedBox(width: 16),

                // FIX LỖI 2: Bắt buộc phải có Expanded ở đây để text không văng ra khỏi chiều ngang
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FIX LỖI 3: Giới hạn tên truyện tối đa 3 dòng, dài quá thì hiện dấu 3 chấm (...)
                      Text(
                        _novel!.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tác giả: ${_novel!.author}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Đã tải: ${_chapters.length} chương',
                        style: const TextStyle(color: Colors.green),
                      ),
                      const SizedBox(height: 12),

                      // LOGIC NÚT BẤM
                      Row(
                        children: [
                          if (_novel!.lastReadChapterIndex > 0)
                            Expanded(
                              // Ép nút bấm vừa vặn màn hình
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OfflineReaderScreen(
                                        novelUrl: widget.novelUrl,
                                        initialChapterIndex:
                                            _novel!.lastReadChapterIndex,
                                      ),
                                    ),
                                  ).then((_) => _loadData());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                ),
                                child: Text(
                                  'Tiếp C.${_novel!.lastReadChapterIndex}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          if (_novel!.lastReadChapterIndex > 0)
                            const SizedBox(width: 4),
                          Expanded(
                            // Ép nút bấm vừa vặn màn hình
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OfflineReaderScreen(
                                      novelUrl: widget.novelUrl,
                                      initialChapterIndex: 1,
                                    ),
                                  ),
                                ).then((_) => _loadData());
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                              ),
                              child: const Text(
                                'Từ đầu',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 2),

          // KHỐI 2: DANH SÁCH CHƯƠNG ĐÃ TẢI
          // FIX LỖI 4: BẮT BUỘC PHẢI CÓ EXPANDED BỌC QUANH LISTVIEW.BUILDER
          // Điều này giúp ListView hiểu là nó chỉ được phép cuộn trong khoảng trống còn lại của màn hình
          Expanded(
            child: ListView.builder(
              itemCount: _chapters.length,
              itemBuilder: (context, index) {
                final chapter = _chapters[index];
                bool isCurrentReading =
                    chapter.chapterIndex == _novel!.lastReadChapterIndex;

                return ListTile(
                  title: Text(
                    chapter.title,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis, // Cắt chữ chương nếu quá dài
                    style: TextStyle(
                      fontWeight: isCurrentReading
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isCurrentReading ? Colors.orange : Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 16,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OfflineReaderScreen(
                          novelUrl: widget.novelUrl,
                          initialChapterIndex: chapter.chapterIndex,
                        ),
                      ),
                    ).then((_) => _loadData());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
