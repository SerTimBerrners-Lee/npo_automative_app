import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:npo_automative_app/library/path.dart';
import 'package:npo_automative_app/packages/complet_sh_repository/lib/src/complet_sh_model.dart';

class ComplectShRepository {

  Future<List<ComplitSh>?> getComplitSh() async {
    final storage = await FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    if (token == null) return null;

    try {
      final res = await http.get(
        Uri.parse('$PATH_SERVER_API'+'shipments/shcheck'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (res.statusCode != 201 && res.statusCode != 200) return null;

      final result = jsonDecode(res.body);
      final decodeUser = ComplitShList.fromJson(result);
      return decodeUser.ships;
    } catch (err) {
      print(err);
    }
  }
}