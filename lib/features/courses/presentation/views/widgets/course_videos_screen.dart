import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/features/courses/presentation/manger/course_cubit/course_cubit..dart';
import 'package:qb_academia/features/courses/presentation/manger/course_cubit/course_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../data/models/course.dart';

class CourseVideosScreen extends StatelessWidget {
  final Course course;

  const CourseVideosScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final videos = course.additionalInfo.video;

    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {},
      builder: (context, state) {
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
          body:
              videos.isEmpty
                  ? const Center(
                    child: Text(
                      "لا توجد فيديوهات متاحة",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  )
                  : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: videos.length,
                          itemBuilder: (context, index) {
                            final video = videos[index];
                            final videoId = YoutubePlayer.convertUrlToId(
                              video.sourceYoutube,
                            );

                            if (videoId == null) {
                              return Container(
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  "رابط فيديو غير صالح ❌",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }

                            final controller = YoutubePlayerController(
                              initialVideoId: videoId,
                              flags: const YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                                enableCaption: false,
                              ),
                            );

                            return Container(
                              margin: const EdgeInsets.only(bottom: 24),
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
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
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
                                      borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(16),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "فيديو تعليمي داخل هذا الكورس",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.share,
                                            color: Colors.deepOrange,
                                          ),
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
                      ),
                      if (state is CourseLessonsSuccessState)
                        Text(state.lessonsModel.data![0].contents![0].postTitle!),
                    ],
                  ),
        );
      },
    );
  }
}
