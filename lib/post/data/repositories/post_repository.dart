import 'package:dio/dio.dart';
import 'package:formation_flutter_join24/post/data/models/post_model.dart';

class PostRepository {
  final Dio dio = Dio();

  Future<List<PostModel>> getPosts() async {
    Response response = await dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );

    List<PostModel> posts = [];

    for (var json in response.data) {
      posts.add(PostModel.fromJson(json));
    }

    return posts;
  }
}
