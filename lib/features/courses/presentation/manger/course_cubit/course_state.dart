import '../../../data/models/course.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoadingState extends CourseState {}

class CourseSuccessState extends CourseState {
  final List<Course> courses;
  CourseSuccessState(this.courses);
}

class CourseErrorState extends CourseState {
  final String message;
  CourseErrorState(this.message);
}
