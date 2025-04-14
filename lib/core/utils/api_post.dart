import 'package:dio/dio.dart';
import '../../features/courses/data/models/PostModel.dart';

class ApiPostService {
  final Dio _dio = Dio();

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _dio.get(
        'https://mo7amy.org/ahmed/wp-json/wp/v2/posts?_embed',
        options: Options(headers: {
          'Accept': 'application/json',
        }),
      );

      return List<PostModel>.from(
        (response.data as List).map((e) => PostModel.fromJson(e)),
      );
    } catch (e) {
      print('Post API Error: $e');
      throw Exception('فشل تحميل المقالات');
    }
  }
}
