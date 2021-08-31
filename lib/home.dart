import 'package:betgame/Constants/ThemeColors.dart';
import 'package:betgame/Models/user.dart';
import 'package:betgame/Widgets/PotatoCategories/PotatoCategories.dart';
import 'package:betgame/Widgets/PotatoCategories/tab_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> items = [Text('data'), Text('data'), Text('data')];
  List<PotatoCategoryItem> menuItem = [
    PotatoCategoryItem(Icons.sports_basketball, '2D'),
    PotatoCategoryItem(Icons.sports_baseball, '3D'),
    PotatoCategoryItem(Icons.sports_esports, 'M'),
    PotatoCategoryItem(Icons.sports_esports, 'M2'),
    PotatoCategoryItem(Icons.sports_golf, 'M3'),
  ];
  List<MenuItem> menuList = [
    MenuItem(Icons.sports_baseball),
    MenuItem(Icons.sports_basketball),
    MenuItem(Icons.sports_cricket),
    MenuItem(Icons.sports_football),
  ];
  late Future<List<User>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = FetchUsers().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    TabItemController _controller = Get.put(TabItemController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                PotatoCategories(menuItem: menuItem),
                SearchBar('Search User'),
                Expanded(
                  child: Obx(
                    () => _controller.curIndex.value == 0
                        ? userListView(futureUser)
                        : userListView(futureUser),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FNavBar(menuList),
            )
          ],
        ),
      ),
    );
  }

  Widget userListView(Future<List<User>> futureUser) {
    return FutureBuilder(
      future: futureUser,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        return RefreshIndicator(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => UserItem(snapshot.data[index].name,
                snapshot.data[index].type, snapshot.data[index].userType),
          ),
          onRefresh: () async {
            setState(() {
              futureUser = FetchUsers().getUsers();
            });
          },
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  final String searchTxt;
  SearchBar(this.searchTxt);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ThemeColors().supportColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: searchTxt,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final String name;
  final String type;
  final String userType;
  UserItem(this.name, this.type, this.userType);
  @override
  Widget build(BuildContext context) {
    return Container(
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

class NavItemController extends GetxController {
  RxInt curIndex = 0.obs;

  void setIndex(index) {
    curIndex.value = index;
  }
}

class FNavBar extends StatelessWidget {
  final List<MenuItem> menuList;
  FNavBar(this.menuList);
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
