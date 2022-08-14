import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> getAuth() async {
  final storage = new FlutterSecureStorage();
  var auth = await storage.read(key: "auth");
  print("Auth: $auth");
  if (auth == null) {
    return false;
  }
  return true;
}