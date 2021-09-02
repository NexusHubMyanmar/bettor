import 'package:betgame/Constants/ThemeColors.dart';
import 'package:betgame/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserItem extends StatelessWidget {
  final int id;
  final String name;
  final String type;
  final String userType;
  UserItem(this.id, this.name, this.type, this.userType);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(UserDetail(), arguments: {'id': id.toString()}),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        height: 85,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ThemeColors().borderColor),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          color: ThemeColors().supportColor),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: FlutterLogo(),
                      ),
                    ),
                    Text(name)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DemText(type),
                    Container(
                      width: 65,
                      height: 15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DemText('Type'),
                          DemText(userType),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DemText extends StatelessWidget {
  final String txt;
  DemText(this.txt);
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: 10,
          color: ThemeColors().primarySuport,
          fontWeight: FontWeight.bold,
          letterSpacing: 1),
    );
  }
}
