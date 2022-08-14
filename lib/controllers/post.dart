import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:npo_automative_app/data/repository.dart';
import 'package:npo_automative_app/models/post.dart';

class PostController extends ControllerMVC {
  final Repository repo = new Repository();

  PostController();

  PostResult currentState = PostResultLoading();

  void init() async {
    try {
      final postList = await repo.fetchPosts();
      setState(() => currentState = PostResultSuccess(postList));
    } catch (error) {
      setState(() => currentState = PostResultFailure("Нет Интернета"));
    }
  }
}