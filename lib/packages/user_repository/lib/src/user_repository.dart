import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser(auth) async {
    if (_user != null) return _user;
    try {
      final res = await http.post(
        Uri.parse('https://server-npo-automotive.ru/api/auth/login'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'tabel': auth[0],
          'password': auth[1],
        }),
      );
      if (res.statusCode != 201) return null;

      final result = jsonDecode(res.body);
      final decodeUser = User.fromJson(result);
      return decodeUser;
    } catch (err) {
      print(err);
    }
  }
}