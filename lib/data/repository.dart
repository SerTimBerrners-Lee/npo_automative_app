import 'dart:convert';

// импортируем http пакет
import 'package:http/http.dart' as http;
import 'package:npo_automative_app/models/photo.dart';
import 'package:npo_automative_app/models/post.dart';

const String SERVER = "https://jsonplaceholder.typicode.com";

class Repository {
  Future<PostList> fetchPosts() async {
    final url = Uri.parse("$SERVER/posts");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed request");
    }
  }

  Future<PostAdd> addPost(Post post) async {
    final url = Uri.parse("$SERVER/posts");
    final response = await http.post(url, body: post.toJson());
    if (response.statusCode == 201) {
      return PostAddSuccess();
    } else {
      return PostAddFailure();
    }
  }

  Future<PhotoList> fetchPhotos() async {
    final url = Uri.parse("$SERVER/photos");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final parse = PhotoList.fromJson(json.decode(res.body));
      return parse;
    } else {
      throw Exception("failed request");
    }
  }
}
