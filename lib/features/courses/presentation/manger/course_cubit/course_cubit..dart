import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/core/utils/api_service.dart';
import '../../../data/models/course.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  final ApiService apiService = ApiService();

  static CourseCubit get(context) => BlocProvider.of(context);

  Future<List<Course>> fetchCourses() async {
    emit(CourseLoadingState());
    try {
      final response = await apiService.get(
        endPoint: 'tutor/v1/courses',
      );
      final courseResponse = CourseResponse.fromJson(response);
      emit(CourseSuccessState(courseResponse.data.posts));
      return courseResponse.data.posts;
    } catch (e) {
      print('❌ Error while fetching courses: $e');
      emit(CourseErrorState('فشل تحميل الكورسات 😓'));
      return [];
    }
  }
}
