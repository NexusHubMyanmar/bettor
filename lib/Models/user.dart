import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String type;
  final String userType;

  User({
    required this.id,
    required this.name,
    required this.type,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      userType: json['userType'] as String,
    );
  }
}

class FetchUsers {
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/users'));
    if (response.statusCode == 200) {
      List userData = jsonDecode(response.body);
      List<User> userList = [];
      for (int i = 0; i < userData.length; i++) {
        userList.add(User.fromJson(userData[i]));
      }
      return userList;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
