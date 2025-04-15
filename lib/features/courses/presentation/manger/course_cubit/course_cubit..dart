import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/core/utils/api_service.dart';
import 'package:qb_academia/features/courses/data/models/course_content_model.dart';
import 'package:qb_academia/features/courses/data/models/lessons_topic_model.dart';
import '../../../data/models/introduction_course_model.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  final ApiService apiService = ApiService();

  static CourseCubit get(context) => BlocProvider.of(context);

  Future<List<Course>> getCoursesIntroduction() async {
    emit(CourseIntroductionLoadingState());
    try {
      final introduction = await apiService.get(
        endPoint: 'tutor/v1/courses',
      );

      final introductionCourseResponse = IntroductionCourseModel.fromJson(introduction);
      emit(CourseIntroductionSuccessState(introductionCourseResponse.data.posts));
      return introductionCourseResponse.data.posts;
    } catch (e) {
      print('❌ Error while fetching courses: $e');
      emit(CourseIntroductionErrorState('فشل تحميل الكورسات 😓'));
      return [];
    }
  }

  Future<CourseContentModel> getCoursesLessons({required String courseContentsId}) async {
    emit(CourseLessonsLoadingState());
    try {
      final courseContent = await apiService.get(
        endPoint: 'tutor/v1/course-contents/$courseContentsId',
      );
      CourseContentModel courseContentModel=CourseContentModel.fromJson(courseContent);
      final lessonsTopic = await apiService.get(
        endPoint: 'tutor/v1/lessons?topic_id=${courseContentModel.data![0].id}',
      );
      LessonsTopicModel lessonsTopicModel=LessonsTopicModel.fromJson(lessonsTopic);
      emit(CourseLessonsSuccessState(lessonsTopicModel));
      return courseContentModel;
    } catch (e) {
      print('❌ Error while fetching courses: $e');
      emit(CourseLessonsErrorState('فشل تحميل الكورسات 😓'));
      return CourseContentModel();
    }
  }
}
