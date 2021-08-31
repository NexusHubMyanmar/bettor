import 'package:betgame/Constants/ThemeColors.dart';
import 'package:betgame/StateControllers/tab_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PotatoSignTabBar extends StatelessWidget {
  final TabState _tabController = Get.put(TabState());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: ThemeColors().supportColor,
          borderRadius: BorderRadius.circular(8)),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).accentColor,
          ),
          tabs: [
            Container(
              child: Center(child: Text('Sign in')),
            ),
            Container(
              child: Center(child: Text('Sign up')),
            )
          ],
          onTap: (value) {
            _tabController.onTabTap(value);
            print(_tabController.index.value);
          },
        ),
      ),
    );
  }
}
