class Chapter {
  final int index;
  final String title;
  final String url;
  final String? content; // Nội dung có thể null (vì lúc lấy danh sách chưa có nội dung)

  Chapter({
    required this.index,
    required this.title,
    required this.url,
    this.content,
  });
}