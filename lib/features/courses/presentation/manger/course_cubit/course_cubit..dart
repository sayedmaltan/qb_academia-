import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/core/utils/api_service.dart';
import 'package:qb_academia/features/courses/data/models/lessons_model.dart';
import '../../../data/models/course.dart';
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

      final courseResponse = CourseResponse.fromJson(introduction);
      emit(CourseIntroductionSuccessState(courseResponse.data.posts));
      return courseResponse.data.posts;
    } catch (e) {
      print('❌ Error while fetching courses: $e');
      emit(CourseIntroductionErrorState('فشل تحميل الكورسات 😓'));
      return [];
    }
  }

  Future<LessonsModel> getCoursesLessons({required String id}) async {
    emit(CourseLessonsLoadingState());
    try {
      final lessons = await apiService.get(
        endPoint: 'tutor/v1/course-contents/$id',
      );

      LessonsModel lessonsModel=LessonsModel.fromJson(lessons);
      emit(CourseLessonsSuccessState(lessonsModel));
      return lessonsModel;
    } catch (e) {
      print('❌ Error while fetching courses: $e');
      emit(CourseLessonsErrorState('فشل تحميل الكورسات 😓'));
      return LessonsModel();
    }
  }
}
