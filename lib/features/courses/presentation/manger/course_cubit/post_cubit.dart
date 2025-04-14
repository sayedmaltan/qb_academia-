import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/features/courses/presentation/manger/course_cubit/post_state.dart';

import '../../../../../core/utils/api_post.dart';

class PostCubit extends Cubit<PostState> {
  final ApiPostService _apiPostService;

  PostCubit(this._apiPostService) : super(PostInitial());

  static PostCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final posts = await _apiPostService.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError("فشل تحميل المقالات"));
    }
  }

  Future<void> refreshPosts() async => await fetchPosts();
}
