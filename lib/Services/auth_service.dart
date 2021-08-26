import 'dart:convert';
import 'package:betgame/Models/user.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<User> getUsers() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:5000/user'));
    if(response.statusCode ==200){
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}