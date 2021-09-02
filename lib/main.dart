import 'package:betgame/Constants/ThemeColors.dart';
import 'package:betgame/home.dart';
import 'package:betgame/login.dart';
import 'package:betgame/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bettor',
      theme: ThemeData(
        primaryColor: ThemeColors().primaryColor,
        accentColor: ThemeColors().accentColor,
      ),
      home: UserDetail(),
      getPages: [
        GetPage(name: '/Home-Page', page: () => Home()),
        GetPage(name: '/User-Details-Page', page: () => UserDetail()),
      ],
    );
  }
}
