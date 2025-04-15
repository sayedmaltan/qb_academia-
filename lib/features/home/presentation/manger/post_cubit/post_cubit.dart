import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qb_academia/core/utils/api_service.dart';
import 'package:qb_academia/features/home/presentation/manger/post_cubit/post_state.dart';

import '../../../../courses/data/models/PostModel.dart';


class PostCubit extends Cubit<PostState> {
  ApiService apiService = ApiService();

  PostCubit() : super(PostInitial());

  static PostCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getPosts() async {
    emit(PostLoading());
    try {
      final response = await apiService.get(endPoint: 'wp/v2/posts?_embed');
      List<PostModel> postResponse = [];
      postResponse = List<PostModel>.from(
        (response).map((e) => PostModel.fromJson(e)),
      );
      emit(PostSuccess(postResponse));
    } catch (e) {
      print('❌ Error while fetching posts: $e');
      emit(PostError('فشل تحميل المقالات 😓'));
    }
  }
}
