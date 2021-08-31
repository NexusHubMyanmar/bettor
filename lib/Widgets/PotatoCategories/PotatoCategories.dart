import 'package:betgame/Widgets/PotatoCategories/constants.dart';
import 'package:betgame/Widgets/PotatoCategories/tab_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PotatoCategories extends StatelessWidget {
  final List<PotatoCategoryItem> menuItem;
  PotatoCategories({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    TabItemController _controller = Get.put(TabItemController());
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 30),
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItem
                .asMap()
                .map((key, value) {
                  var isActive = false;
                  key == _controller.curIndex.value
                      ? isActive = true
                      : isActive = false;
                  return MapEntry(
                    key,
                    GestureDetector(
                      onTap: () {
                        _controller.setIndex(key);
                      },
                      child: PotatoCategoryItem(
                        value.icon,
                        value.text,
                        isActive: isActive,
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          )),
    );
  }
}

class PotatoCategoryItem extends StatelessWidget {
  final bool isActive;
  final String text;
  final IconData icon;
  PotatoCategoryItem(this.icon, this.text, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: isActive ? 70 : 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isActive ? Constants.bgColorActive : Constants.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(
              icon,
              color: isActive
                  ? Constants.contentColorActive
                  : Constants.contentColor,
            ),
          ),
          Text(
            isActive ? text : '',
            style: TextStyle(
              color: isActive
                  ? Constants.contentColorActive
                  : Constants.contentColor,
            ),
          ),
        ],
      ),
    );
  }
}

            // var isActive = false;
            // index == _controller.curIndex.value
            //     ? isActive = true
            //     : isActive = false;


// GestureDetector(
//               child: PotatoCategoryItem(
//                 Icons.sports_esports,
//                 'M',
//                 isActive: isActive,
//               ),
//               onTap: () {
//                 _controller.setIndex(index);
//               },
//             )