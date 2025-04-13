import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/core/utils/api_service.dart';
import '../../../data/models/course.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
  ApiService apiService=ApiService();

  static CourseCubit get(context) {
    return BlocProvider.of(context);
  }
  Future<List<Course>> fetchCourses() async {
    try {
      emit(CourseLoadingState());
      final response = await apiService.get(
        endPoint: 'http://mo7amy.org/ahmed/wp-json/tutor/v1/courses',
      );
      final courseResponse = CourseResponse.fromJson(response);
      emit(CourseSuccessState(courseResponse.data.posts));
      return courseResponse.data.posts; // دي اللي محتاجينها فقط
    } catch (e) {
      print('Error: $e');
      throw Exception('فشل تحميل الكورسات');
    }
  }
}
