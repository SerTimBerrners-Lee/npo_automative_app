import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthUserBloc {
  bool? isAuth;


  final storage = new FlutterSecureStorage();

  Future<bool> getAuth() async {
    var auth = await storage.read(key: "auth");
    print("Auth: $auth");
    if (auth == null) {
      isAuth = false;
      return false;
    }
    isAuth = true;
    return true;
  }

  void authorized() async {
    await storage.write(key: "auth", value: "testValue");
    isAuth = true;
  }

  void loggout() async {
    await storage.deleteAll();
    isAuth = false;
  }

}