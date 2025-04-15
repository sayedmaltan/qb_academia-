import 'package:flutter/material.dart';
import '../../../data/models/course.dart';
import '../../manger/course_cubit/course_cubit..dart';
import 'course_videos_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9C19A),
        title: Text(
          course.postTitle.isNotEmpty ? course.postTitle : 'تفاصيل الكورس',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              course.thumbnailUrl.isNotEmpty
                  ? course.thumbnailUrl
                  : 'https://via.placeholder.com/400x200?text=No+Image',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 220,
              errorBuilder: (_, __, ___) => const SizedBox(
                height: 200,
                child: Center(child: Icon(Icons.broken_image, size: 40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                course.postTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            if (course.additionalInfo.courseBenefits.isNotEmpty)
              _buildSection(
                title: 'فوائد الكورس',
                items: course.additionalInfo.courseBenefits,
              ),
            if (course.additionalInfo.courseRequirements.isNotEmpty)
              _buildSection(
                title: 'المتطلبات',
                items: course.additionalInfo.courseRequirements,
              ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9C19A),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    CourseCubit courseCubit = CourseCubit.get(context);
                    print(course.id.toString());
                  await courseCubit.getCoursesLessons(id: course.id.toString());
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            CourseVideosScreen(course: course),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            ),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("ابدأ التعلّم الآن"),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 6),
          ...items.map(
                (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(item, style: const TextStyle(fontSize: 15, color: Colors.black87)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}