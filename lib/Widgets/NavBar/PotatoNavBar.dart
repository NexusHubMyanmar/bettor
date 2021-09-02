import 'package:betgame/StateControllers/nav_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PotatoNavBar extends StatelessWidget {
  final List<MenuItem> menuList;
  PotatoNavBar(this.menuList);
  @override
  Widget build(BuildContext context) {
    NavItemController _controller = Get.put(NavItemController());
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 75,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 3, offset: Offset(2, 2))
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: menuList
                      .asMap()
                      .map((key, value) {
                        Color iconColor = Colors.grey;
                        key == _controller.curIndex.value
                            ? iconColor = Colors.white
                            : iconColor = Colors.grey;
                        return MapEntry(
                          key,
                          GestureDetector(
                            onTap: () {
                              _controller.setIndex(key);
                            },
                            child: MenuItem(
                              value.icon,
                              iconColor: iconColor,
                            ),
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  MenuItem(this.icon, {this.iconColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      color: Colors.transparent,
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
