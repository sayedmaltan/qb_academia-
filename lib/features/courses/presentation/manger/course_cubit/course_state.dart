import '../../../data/models/introduction_course_model.dart';
import '../../../data/models/lessons_topic_model.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseIntroductionLoadingState extends CourseState {}

class CourseIntroductionSuccessState extends CourseState {
  final List<Course> courses;
  CourseIntroductionSuccessState(this.courses);
}

class CourseIntroductionErrorState extends CourseState {
  final String message;
  CourseIntroductionErrorState(this.message);
}

class CourseLessonsLoadingState extends CourseState {}

class CourseLessonsSuccessState extends CourseState {
  final LessonsTopicModel lessonsTopicModel;
  CourseLessonsSuccessState(this.lessonsTopicModel);
}

class CourseLessonsErrorState extends CourseState {
  final String message;
  CourseLessonsErrorState(this.message);
}
