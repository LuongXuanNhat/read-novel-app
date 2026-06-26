class Novel {
  final String title;
  final String author;
  final String coverUrl;
  final String sourceUrl;
  final String domain;

  Novel({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.sourceUrl,
    required this.domain,
  });
  // Biến Object thành Map để lưu lên Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'coverUrl': coverUrl,
      'sourceUrl': sourceUrl,
      'domain': domain,
      'createdAt': DateTime.now().millisecondsSinceEpoch, // Lưu thời gian thêm
    };
  }

  // Lấy dữ liệu từ Firebase biến ngược lại thành Object
  factory Novel.fromMap(Map<String, dynamic> map) {
    return Novel(
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      coverUrl: map['coverUrl'] ?? '',
      sourceUrl: map['sourceUrl'] ?? '',
      domain: map['domain'] ?? '',
    );
  }
}