import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/core/utils/widgets/custom_loading_button.dart';
import 'package:qb_academia/features/courses/presentation/manger/course_cubit/course_cubit..dart';
import 'package:qb_academia/features/courses/presentation/manger/course_cubit/course_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../courses/data/models/course.dart';
import '../../../../courses/presentation/views/widgets/CourseDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<Course> courses = [];

  @override
  Widget build(BuildContext context) {
    CourseCubit courseCubit = CourseCubit.get(context);
    courseCubit.fetchCourses();
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CourseSuccessState) {
          courses = state.courses;
          return Scaffold(
            backgroundColor: const Color(0xFFF2F2F2),
            appBar: AppBar(
              title: const Text(
                "الدورات التعليمية",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFFF9C19A),
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body:
                isLoading
                    ? ListView.builder(
                      itemCount: 6,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 220,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                    )
                    : ListView.separated(
                      itemCount: courses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final course = courses[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => CourseDetailScreen(course: course),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    course.thumbnailUrl,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (_, __, ___) => Container(
                                          height: 200,
                                          color: Colors.grey[300],
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.broken_image,
                                            size: 50,
                                          ),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    course.postTitle,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          );
        } else {
          return CustomLoadingButton();
        }
      },
    );
  }
}
