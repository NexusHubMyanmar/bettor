import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Get.arguments['id'] ?? 'UserDetail'),
      ),
    );
  }
}
