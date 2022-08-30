import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:npo_automative_app/library/path.dart';
import 'models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser(auth) async {
    if (_user != null) return _user;
    final storage = await FlutterSecureStorage();
    try {
      final res = await http.post(
        Uri.parse('$PATH_SERVER_API'+'auth/login'),
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

      if (decodeUser.token == null) return null;
      else await storage.write(key: 'token', value: decodeUser.token);

      return decodeUser;
    } catch (err) {
      print(err);
    }
  }
}