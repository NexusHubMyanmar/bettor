import 'package:betgame/StateControllers/tab_state_controller.dart';
import 'package:betgame/Widgets/Signin_out/PotatoSignTabBar.dart';
import 'package:betgame/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TabState _tabController = Get.put(TabState());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Icon(
                    Icons.sports_baseball_outlined,
                    size: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    PotatoSignTabBar(),
                    Obx(() {
                      return _tabController.index.value == 0
                          ? Column(
                              children: [
                                userInput(context, 'Username', false),
                                userInput(context, 'Password', true),
                                themeButton(
                                  context,
                                  'Confirm',
                                  Size(150, 40),
                                  Theme.of(context).primaryColor,
                                ),
                              ],
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 50),
                              child: themeButton(
                                context,
                                'Call Now',
                                Size(150, 40),
                                Theme.of(context).primaryColor,
                              ),
                            );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget userInput(BuildContext context, String placeholder, bool hide) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: hide,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: placeholder,
        ),
      ),
    );
  }

  Widget themeButton(
      BuildContext context, String text, Size size, Color color) {
    return ElevatedButton(
      onPressed: () => Get.off(() => Home()),
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: size,
      ),
    );
  }
}
