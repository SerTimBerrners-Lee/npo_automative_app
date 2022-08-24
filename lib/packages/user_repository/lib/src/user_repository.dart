import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser(auth) async {
    if (_user != null) return _user;
    try {
      print("$auth");
      // final ress = await http.get(Uri.parse('http://localhost:5000/api/data/true'));
      final res = await http.post(
        Uri.parse('https://server-npo-automotive.ru/api/auth/login'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'login': 'Перов Д.А.',
          'password': '54321',
        }),
      );
      
      if (res.statusCode != 201) return null;

      final result = jsonDecode(res.body);
      final decode = User.fromJson(result);
      print(decode);
      return decode;
    } catch (err) {
      print(err);
    }
  }
}