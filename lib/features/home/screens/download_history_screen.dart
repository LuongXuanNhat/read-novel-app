import 'package:flutter/material.dart';
import '../../../data/local_database/isar_models.dart';
import '../../../data/local_database/isar_service.dart';
import '../../offline_reader/screens/offline_novel_detail_screen.dart';

class DownloadHistoryScreen extends StatefulWidget {
  const DownloadHistoryScreen({super.key});

  @override
  State<DownloadHistoryScreen> createState() => _DownloadHistoryScreenState();
}

class _DownloadHistoryScreenState extends State<DownloadHistoryScreen> {
  List<NovelLocal> _novels = [];
  bool _isLoading = true;

  // --- CÁC BIẾN QUẢN LÝ TÍNH NĂNG XÓA ---
  bool _isSelectionMode = false; // Đang ở chế độ chọn hay không?
  Set<String> _selectedUrls = {}; // Chứa danh sách các link truyện đang được tick chọn

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    setState(() => _isLoading = true);
    final data = await IsarService().getDownloadedNovels();
    setState(() {
      _novels = data;
      _isLoading = false;
      // Reset lại trạng thái chọn khi load data mới
      _isSelectionMode = false;
      _selectedUrls.clear();
    });
  }

  // --- HÀM XỬ LÝ KHI BẤM NÚT XÓA (HIỆN DIALOG) ---
  void _confirmDelete() {
    if (_selectedUrls.isEmpty) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          content: Text('Bạn có chắc chắn muốn xóa ${_selectedUrls.length} truyện đã chọn cùng toàn bộ dữ liệu chương đã tải không?\n\nHành động này không thể hoàn tác.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Đóng hộp thoại
              child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context); // Đóng hộp thoại

                setState(() => _isLoading = true);

                // Gọi hàm xóa ở IsarService
                await IsarService().deleteNovels(_selectedUrls.toList());

                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã xóa thành công giải phóng bộ nhớ!')),
                  );
                }

                // Load lại danh sách mới
                _loadHistory();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: const Text('Xóa tất cả'),
            ),
          ],
        );
      },
    );
  }

  // --- HÀM CHỌN TẤT CẢ ---
  void _selectAll() {
    setState(() {
      if (_selectedUrls.length == _novels.length) {
        _selectedUrls.clear(); // Nếu đang chọn hết thì bỏ chọn hết
        _isSelectionMode = false;
      } else {
        _selectedUrls = _novels.map((n) => n.sourceUrl).toSet(); // Chọn hết
      }
    });
  }

  // --- GIAO DIỆN THANH CÔNG CỤ (APPBAR) ---
  PreferredSizeWidget _buildAppBar() {
    if (_isSelectionMode) {
      return AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              _isSelectionMode = false;
              _selectedUrls.clear();
            });
          },
        ),
        title: Text('Đã chọn ${_selectedUrls.length}', style: const TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.select_all),
            tooltip: 'Chọn tất cả',
            onPressed: _selectAll,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            tooltip: 'Xóa',
            onPressed: _selectedUrls.isNotEmpty ? _confirmDelete : null,
          ),
        ],
      );
    }

    return AppBar(
      title: const Text('Lịch sử tải truyện'),
      actions: [
        if (_novels.isNotEmpty) // Chỉ hiện icon Thùng rác nếu có truyện
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              setState(() {
                _isSelectionMode = true;
              });
            },
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // PopScope giúp xử lý phím Back của Android: Nếu đang ở chế độ chọn thì thoát chế độ chọn thay vì thoát app
    return PopScope(
      canPop: !_isSelectionMode,
      onPopInvoked: (didPop) {
        if (!didPop) {
          setState(() {
            _isSelectionMode = false;
            _selectedUrls.clear();
          });
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: RefreshIndicator(
          onRefresh: _loadHistory,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _novels.isEmpty
              ? Stack(
            children: [
              ListView(),
              const Center(child: Text('Bạn chưa tải truyện nào.')),
            ],
          )
              : ListView.builder(
            itemCount: _novels.length,
            itemBuilder: (context, index) {
              final novel = _novels[index];
              final isSelected = _selectedUrls.contains(novel.sourceUrl);

              return Card(
                color: isSelected ? Colors.blue.shade50 : Colors.white, // Đổi màu nền nếu được chọn
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: ListTile(
                  leading: _isSelectionMode
                      ? Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _selectedUrls.add(novel.sourceUrl);
                        } else {
                          _selectedUrls.remove(novel.sourceUrl);
                          if (_selectedUrls.isEmpty) _isSelectionMode = false;
                        }
                      });
                    },
                  )
                      : SizedBox(
                    width: 40,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: novel.coverUrl.isNotEmpty
                          ? Image.network(
                        novel.coverUrl.startsWith('http')
                            ? novel.coverUrl
                            : 'https://${novel.domain}${novel.coverUrl}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.book,
                              color: Colors.grey,
                            ),
                          );
                        },
                      )
                          : Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.book, color: Colors.grey),
                      ),
                    ),
                  ),
                  title: Text(novel.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Đang đọc: Chương ${novel.lastReadChapterIndex}'),

                  // LOGIC BẤM GIỮ (LONG PRESS) ĐỂ BẬT CHẾ ĐỘ CHỌN
                  onLongPress: () {
                    setState(() {
                      _isSelectionMode = true;
                      _selectedUrls.add(novel.sourceUrl);
                    });
                  },

                  // LOGIC BẤM BÌNH THƯỜNG (TAP)
                  onTap: () async {
                    if (_isSelectionMode) {
                      // Nếu đang bật Xóa -> Click vào là Tick/Untick
                      setState(() {
                        if (isSelected) {
                          _selectedUrls.remove(novel.sourceUrl);
                          if (_selectedUrls.isEmpty) _isSelectionMode = false;
                        } else {
                          _selectedUrls.add(novel.sourceUrl);
                        }
                      });
                    } else {
                      // Nếu bình thường -> Click vào là Mở truyện đọc
                      await IsarService().updateLastAccessed(novel.sourceUrl);
                      if (mounted) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => OfflineNovelDetailScreen(novelUrl: novel.sourceUrl),
                        )).then((_) => _loadHistory());
                      }
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}