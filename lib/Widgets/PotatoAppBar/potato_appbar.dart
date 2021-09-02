import 'package:betgame/Constants/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PotatoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ThemeColors().supportColor),
              child: Icon(
                Icons.arrow_back,
                color: ThemeColors().primarySuport,
              ),
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ThemeColors().supportColor),
            child: Icon(
              Icons.settings,
              color: ThemeColors().primarySuport,
            ),
          ),
        ],
      ),
    );
  }
}
