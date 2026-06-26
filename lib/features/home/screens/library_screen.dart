import 'package:flutter/material.dart';
import 'source_detail_screen.dart';

// Tạm thời tạo một model nhỏ để chứa thông tin nguồn truyện
class SourceModel {
  final String name;
  final String domain;
  final Color color;

  SourceModel(this.name, this.domain, this.color);
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách 3 nguồn truyện của bạn
    final List<SourceModel> sources = [
      SourceModel('Mê Truyện Chữ', 'metruyenchuvn.com', Colors.blue.shade700),
      SourceModel('Truyện Full', 'truyenfull.today', Colors.green.shade700),
      SourceModel('Truyện Hay', 'truyenhay.app', Colors.orange.shade700),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nguồn Thư Viện', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: sources.length,
          itemBuilder: (context, index) {
            final source = sources[index];

            return Card(
              elevation: 4, // Đổ bóng cho đẹp
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                borderRadius: BorderRadius.circular(12), // Hiệu ứng ripple khi bấm
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SourceDetailScreen(
                        sourceName: source.name,
                        domain: source.domain,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      // Icon đại diện
                      CircleAvatar(
                        backgroundColor: source.color,
                        radius: 25,
                        child: Text(
                          source.name[0], // Lấy chữ cái đầu tiên làm icon
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Text hiển thị
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              source.name,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              source.domain,
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                      // Mũi tên bên phải
                      const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}