import 'package:flutter/foundation.dart';

class User {
  final String username;
  final String password;

  User({
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['user'] as String,
      password: json['pass'] as String,
    );
  }
}