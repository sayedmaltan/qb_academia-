import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/models/course.dart';

class CourseVideosScreen extends StatelessWidget {
  final Course course;

  const CourseVideosScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final videos = course.additionalInfo.video;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: Text(
          course.postTitle,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9C19A),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: videos.isEmpty
          ? const Center(
        child: Text(
          "لا توجد فيديوهات متاحة",
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
      )
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: videos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final video = videos[index];
          final videoId = YoutubePlayer.convertUrlToId(video.sourceYoutube);

          if (videoId == null) {
            return const Text(
              "رابط فيديو غير صالح",
              style: TextStyle(color: Colors.red),
            );
          }

          final controller = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          );

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.deepOrange,
                        handleColor: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          "محتوى الفيديو هنا أو وصف بسيط",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.deepOrange),
                        tooltip: 'مشاركة الفيديو',
                        onPressed: () {
                          Share.share(video.sourceYoutube);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
