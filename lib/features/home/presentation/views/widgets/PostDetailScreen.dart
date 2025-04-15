import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../../courses/data/models/PostModel.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9C19A),
        title: Text(
          post.title.rendered,
          style: const TextStyle(color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🗓️ التاريخ
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.black54),
                const SizedBox(width: 6),
                Text(
                  post.date.split('T')[0], // مجرد التاريخ بدون الوقت
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 📰 العنوان
            Text(
              post.title.rendered,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 24, thickness: 1.5),

            // 📝 المحتوى المنسق
            Html(
              data: post.content.rendered,
              style: {
                "body": Style(
                  fontSize: FontSize(16),
                  color: Colors.black87,
                  lineHeight: LineHeight.number(1.7),
                ),
                "strong": Style(fontWeight: FontWeight.bold),
                "p": Style(margin: Margins.only(bottom: 12)),

              },
            ),
          ],
        ),
      ),
    );
  }
}
