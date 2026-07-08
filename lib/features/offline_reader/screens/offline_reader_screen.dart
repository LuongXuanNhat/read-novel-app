import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/local_database/isar_models.dart';
import '../../../data/local_database/isar_service.dart';

class OfflineReaderScreen extends StatefulWidget {
  final String novelUrl;
  final int initialChapterIndex; // Bắt đầu mở từ chương mấy?

  const OfflineReaderScreen({
    super.key,
    required this.novelUrl,
    required this.initialChapterIndex,
  });

  @override
  State<OfflineReaderScreen> createState() => _OfflineReaderScreenState();
}

class _OfflineReaderScreenState extends State<OfflineReaderScreen> {
  ChapterLocal? _currentChapter;
  bool _isLoading = true;
  Timer? _saveDebounce;

  List<ChapterLocal> _chapters = [];
  double _scrollPercent = 0.0;
  bool _isDragging = false;

  double _maxOverscrollTop = 0.0;
  double _maxOverscrollBottom = 0.0;

  // --- QUẢN LÝ CUỘN (SCROLL) ---
  final ScrollController _scrollController = ScrollController();

  // --- QUẢN LÝ CẤU HÌNH (TEMPLATE) ---
  double _fontSize = 18.0;
  Color _bgColor = Colors.white;
  Color _textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _loadSettings(); // Tải cấu hình màu/font từ bộ nhớ
    _loadChapters(); // Tải danh sách chương cho bottom sheet
    _loadChapter(widget.initialChapterIndex); // Tải chương truyện
    _scrollController.addListener(_onScroll);
  }

  Future<void> _loadChapters() async {
    final db = IsarService();
    final list = await db.getDownloadedChapters(widget.novelUrl);
    if (mounted) {
      setState(() {
        _chapters = list;
      });
    }
  }

  // --- LƯU VỊ TRÍ CUỘN NGAY KHI ĐANG ĐỌC (debounce 500ms) ---
  // Quan trọng: làm việc này thay cho lưu trong dispose(), vì lúc dispose()
  // Scrollable con đã detach khỏi controller (hasClients luôn false),
  // nên dispose() gần như không bao giờ lưu thành công trên thực tế.
  void _onScroll() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;

      // Lưu lại độ kéo kịch biên lớn nhất trong lúc kéo vuốt
      if (currentScroll < 0) {
        double pull = -currentScroll;
        if (pull > _maxOverscrollTop) {
          _maxOverscrollTop = pull;
        }
      } else if (maxScroll > 0 && currentScroll > maxScroll) {
        double pull = currentScroll - maxScroll;
        if (pull > _maxOverscrollBottom) {
          _maxOverscrollBottom = pull;
        }
      } else if (maxScroll == 0 && currentScroll > 0) {
        // Cho chương ngắn không có maxScrollExtent
        double pull = currentScroll;
        if (pull > _maxOverscrollBottom) {
          _maxOverscrollBottom = pull;
        }
      }

      double pct = 0.0;
      if (maxScroll > 0) {
        pct = (currentScroll / maxScroll * 100).clamp(0.0, 100.0);
      }
      if (pct.round() != _scrollPercent.round()) {
        setState(() {
          _scrollPercent = pct;
        });
      }
    }

    _saveDebounce?.cancel();
    _saveDebounce = Timer(const Duration(milliseconds: 500), () {
      _saveCurrentScrollPosition();
    });
  }

  @override
  void dispose() {
    _saveDebounce?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // --- HÀM TẢI CẤU HÌNH TEMPLATE TỪ SHARED PREFERENCES ---
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('fontSize') ?? 18.0;
      int bgValue = prefs.getInt('bgColor') ?? Colors.white.value;
      int textValue = prefs.getInt('textColor') ?? Colors.black.value;
      _bgColor = Color(bgValue);
      _textColor = Color(textValue);
    });
  }

  // --- HÀM LƯU CẤU HÌNH TEMPLATE ---
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', _fontSize);
    await prefs.setInt('bgColor', _bgColor.value);
    await prefs.setInt('textColor', _textColor.value);
  }

  // --- HÀM LƯU VỊ TRÍ CUỘN XUỐNG DATABASE ---
  Future<void> _saveCurrentScrollPosition() async {
    if (_currentChapter != null && _scrollController.hasClients) {
      double currentOffset = _scrollController.offset;
      await IsarService().updateScrollOffset(_currentChapter!.id, currentOffset);
    }
  }

  // --- HÀM LOAD CHƯƠNG TRUYỆN MỚI ---
  Future<void> _loadChapter(int index) async {
    // Nếu đang đọc chương cũ, lưu vị trí cuộn của chương cũ lại trước khi chuyển
    await _saveCurrentScrollPosition();

    setState(() => _isLoading = true);

    final db = IsarService();
    final chapter = await db.getChapterByIndex(widget.novelUrl, index);

    if (chapter != null) {
      // Đánh dấu chương đang đọc
      await db.updateReadingProgress(widget.novelUrl, index);

      setState(() {
        _currentChapter = chapter;
        _isLoading = false;
      });

      // ⚠️ MA THUẬT FIX LỖI CUỘN: Đợi 150 mili-giây để text vẽ xong chiều cao
      Future.delayed(const Duration(milliseconds: 150), () {
        if (mounted && _scrollController.hasClients) {
          double targetScroll = 0;
          if (chapter.scrollOffset > 0) {
            // Lấy chiều cao tối đa, đề phòng offset vượt quá giới hạn
            double maxScroll = _scrollController.position.maxScrollExtent;
            targetScroll = chapter.scrollOffset > maxScroll ? maxScroll : chapter.scrollOffset;

            _scrollController.jumpTo(targetScroll);
          } else {
            // Chương mới toanh, nhảy lên đầu
            _scrollController.jumpTo(0);
          }

          double maxScroll = _scrollController.position.maxScrollExtent;
          double pct = 0.0;
          if (maxScroll > 0) {
            pct = (targetScroll / maxScroll * 100).clamp(0.0, 100.0);
          }
          setState(() {
            _scrollPercent = pct;
          });
        }
      });
    } else {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chương này chưa được tải offline!')));
      }
    }
  }

  void _showChaptersBottomSheet() {
    int currentIdx = _chapters.indexWhere((c) => c.chapterIndex == _currentChapter?.chapterIndex);
    final sheetScrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentIdx != -1 && sheetScrollController.hasClients) {
        double targetOffset = (currentIdx * 56.0);
        if (sheetScrollController.position.hasContentDimensions) {
          double viewportHeight = sheetScrollController.position.viewportDimension;
          targetOffset = (currentIdx * 56.0) - (viewportHeight / 2) + 28.0;
          double maxScroll = sheetScrollController.position.maxScrollExtent;
          double minScroll = sheetScrollController.position.minScrollExtent;
          targetOffset = targetOffset.clamp(minScroll, maxScroll);
        }
        sheetScrollController.jumpTo(targetOffset);
      }
    });

    showModalBottomSheet(
      context: context,
      backgroundColor: _bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Danh sách chương',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  controller: sheetScrollController,
                  itemCount: _chapters.length,
                  itemExtent: 56.0,
                  itemBuilder: (context, index) {
                    final ch = _chapters[index];
                    bool isCurrent = ch.chapterIndex == _currentChapter?.chapterIndex;
                    return ListTile(
                      title: Text(
                        ch.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isCurrent ? Colors.orange : _textColor,
                          fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _loadChapter(ch.chapterIndex);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _checkPullToNavigate() {
    if (_currentChapter == null) return;

    const double threshold = 60.0; // Ngưỡng kéo vuốt nhạy hơn để dễ dùng (60px thay vì 80px)

    if (_maxOverscrollTop >= threshold) {
      _maxOverscrollTop = 0.0;
      _maxOverscrollBottom = 0.0;
      if (_currentChapter!.chapterIndex > 1) {
        _loadChapter(_currentChapter!.chapterIndex - 1);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đây là chương đầu tiên')),
        );
      }
    } else if (_maxOverscrollBottom >= threshold) {
      _maxOverscrollTop = 0.0;
      _maxOverscrollBottom = 0.0;
      _loadChapter(_currentChapter!.chapterIndex + 1);
    }

    // Luôn reset sau khi nhấc ngón tay để chuẩn bị cho lần kéo tiếp theo
    _maxOverscrollTop = 0.0;
    _maxOverscrollBottom = 0.0;
  }


  // --- GIAO DIỆN HỘP THOẠI CẤU HÌNH (TEMPLATE) ---
  void _showSettingsBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder( // StatefulBuilder để giao diện hộp thoại tự cập nhật ngay lập tức
            builder: (context, setModalState) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tùy chỉnh hiển thị', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),

                    // 1. Chỉnh Cỡ Chữ
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Cỡ chữ:'),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                setModalState(() => _fontSize -= 2);
                                setState(() {}); // Cập nhật cả màn hình đọc ở dưới
                                _saveSettings();
                              },
                            ),
                            Text('${_fontSize.toInt()}', style: const TextStyle(fontSize: 18)),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                setModalState(() => _fontSize += 2);
                                setState(() {});
                                _saveSettings();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(),

                    // 2. Chỉnh Màu Nền (Template Sáng / Giấy cũ / Tối)
                    const Text('Màu nền:'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Nền trắng - Chữ đen
                        _buildColorButton(Colors.white, Colors.black, 'Sáng', setModalState),
                        // Nền vàng giấy cũ - Chữ nâu đen
                        _buildColorButton(const Color(0xFFF4EBD9), const Color(0xFF3E2D1F), 'Giấy cũ', setModalState),
                        // Nền đen - Chữ xám trắng
                        _buildColorButton(const Color(0xFF1E1E1E), const Color(0xFFCCCCCC), 'Tối', setModalState),
                      ],
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }

  // Widget vẽ các ô màu tròn
  Widget _buildColorButton(Color bg, Color text, String label, Function setModalState) {
    return GestureDetector(
      onTap: () {
        setModalState(() {
          _bgColor = bg;
          _textColor = text;
        });
        setState(() {}); // Báo cho màn hình Reader cập nhật màu
        _saveSettings();
      },
      child: Column(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: bg, shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade400, width: 1),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor, // Áp dụng màu nền
      appBar: AppBar(
        backgroundColor: _bgColor,
        iconTheme: IconThemeData(color: _textColor), // Màu nút Back
        elevation: 0,
        title: _currentChapter != null
            ? Text('Chương ${_currentChapter!.chapterIndex}', style: TextStyle(color: _textColor, fontSize: 16))
            : const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Danh sách chương',
            onPressed: _showChaptersBottomSheet,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Tùy chỉnh hiển thị',
            onPressed: _showSettingsBottomSheet, // Mở bảng Setting
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '${_scrollPercent.round()}%',
                style: TextStyle(
                  color: _textColor.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: _textColor))
          : _currentChapter == null
          ? Center(child: Text('Lỗi tải chương.', style: TextStyle(color: _textColor)))
          : NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is UserScrollNotification) {
                  if (notification.direction != ScrollDirection.idle) {
                    _isDragging = true;
                    // Reset giá trị kéo biên khi bắt đầu kéo mới
                    _maxOverscrollTop = 0.0;
                    _maxOverscrollBottom = 0.0;
                  } else if (notification.direction == ScrollDirection.idle && _isDragging) {
                    _isDragging = false;
                    _checkPullToNavigate();
                  }
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: _scrollController, // Gắn bộ theo dõi cuộn vào đây
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tiêu đề chương
                    Text(
                      _currentChapter!.title,
                      style: TextStyle(color: _textColor, fontSize: _fontSize + 4, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    // Nội dung chương
                    Text(
                      _currentChapter!.content,
                      style: TextStyle(color: _textColor, fontSize: _fontSize, height: 1.6), // height 1.6 để giãn dòng dễ đọc
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }
}