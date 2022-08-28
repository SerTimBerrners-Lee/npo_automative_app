import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.initial, this.email, this.phone, this.login, this.tabel, this.role);

  final String id, initial, tabel, login, phone, email;
  final Map<String, dynamic> role;

  @override
  List<Object> get props => [id];
  static const empty = User('-','-','-','-','-','-', {});

  User.fromJson(Map<String, dynamic> json) :
    id = json['id'].toString(),
    initial = json['initial'],
    email = json['email'],
    phone = json['phone'],
    login = json['login'],
    tabel = json['tabel'],
    role = json['role'];
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'initial': initial,
    'email': email,
    'phone': phone,
    'login': login,
    'tabel': tabel,
    'role': role
  };
}

abstract class UserResult {}

// указывает на успешный запрос
class UserResultSuccess extends UserResult {
  final User user;
  UserResultSuccess(this.user);
}

// произошла ошибка
class UserResultFailure extends UserResult {
  final String error;
  UserResultFailure(this.error);
}

// загрузка данных
class UserResultLoading extends UserResult {
  UserResultLoading();
} 