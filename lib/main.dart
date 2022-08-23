import 'package:npo_automative_app/app.dart';
import 'package:npo_automative_app/packages/authentication_repository/lib/src/authentication_repository.dart';
import 'package:npo_automative_app/packages/user_repository/lib/src/user_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    )
  );
}