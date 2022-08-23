import 'package:equatable/equatable.dart';
class User extends Equatable {
  const User(this.id, this.initial, this.email, this.phone, this.login, this.tabel);

  final String id, initial, tabel, login, phone, email;

  @override
  List<Object> get props => [id];
  static const empty = User('-','-','-','-','-','-');

  User.fromJson(Map<String, dynamic> json) :
    this.id = json['id'].toString(),
    this.initial = json['initial'],
    this.email = json['email'],
    this.phone = json['phone'],
    this.login = json['login'],
    this.tabel = json['tabel'];
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'initial': initial,
    'email': email,
    'phone': phone,
    'login': login,
    'tabel': tabel,
  };
}