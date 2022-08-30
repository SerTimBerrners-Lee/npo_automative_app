import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  String? _tabel;
  String? _password;

  List<String?> get auth => [_tabel, _password];
  
  final storage = new FlutterSecureStorage();

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    _tabel = username;
    _password = password;
    
    await storage.write(key: 'tabel', value: _tabel);
    await storage.write(key: 'password', value: _password);

    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() async {
    await storage.deleteAll();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}