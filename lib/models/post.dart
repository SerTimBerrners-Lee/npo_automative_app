import 'dart:convert';

class Post {
  final int? _userId;
  final int? _id;
  final String? _title;
  final String? _body;

  int? get userId => _userId;
  int? get id => _id;
  String? get title => _title;
  String? get body => _body;

  Post(this._userId, this._id, this._title, this._body);
  String toJson() {
    return json.encode({
      "title": _title,
      "content": _body,
    });
  }

  Post.fromJson(Map<String, dynamic> json) :
    this._userId = json["userId"],
    this._id = json["id"],
    this._title = json["title"],
    this._body = json["body"];

}

abstract class PostAdd {}

class PostAddSuccess extends PostAdd {}

class PostAddFailure extends PostAdd {}

class PostList {
  final List<Post> posts = [];
  PostList.fromJson(List<dynamic> jsonItems) {
    for (var jsonItem in jsonItems) {
      posts.add(Post.fromJson(jsonItem));
    }
  }

}

abstract class PostResult {}

// указывает на успешный запрос
class PostResultSuccess extends PostResult {
  final PostList postList;
  PostResultSuccess(this.postList);
}

// произошла ошибка
class PostResultFailure extends PostResult {
  final String error;
  PostResultFailure(this.error);
}

// загрузка данных
class PostResultLoading extends PostResult {
  PostResultLoading();
}