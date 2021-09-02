import 'package:betgame/Models/user.dart';
import 'package:betgame/Widgets/NavBar/PotatoNavBar.dart';
import 'package:betgame/Widgets/PotatoCategories/PotatoCategories.dart';
import 'package:betgame/Widgets/PotatoCategories/tab_item_controller.dart';
import 'package:betgame/Widgets/SearchBar/search_bar.dart';
import 'package:betgame/Widgets/UserListView/user_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                        : _controller.curIndex.value == 1
                            ? userListView(futureUser)
                            : Center(
                                child: Text(
                                  'Under Development',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PotatoNavBar(menuList),
            )
          ],
        ),
      ),
    );
  }

  Widget userListView(Future<List<User>> futureUser) {
    return FutureBuilder(
      future: futureUser,
      initialData: [],
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.data.length != 0
            ? RefreshIndicator(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => UserItem(
                      snapshot.data[index].id,
                      snapshot.data[index].name,
                      snapshot.data[index].type,
                      snapshot.data[index].userType),
                ),
                onRefresh: () async {
                  setState(() {
                    futureUser = FetchUsers().getUsers();
                  });
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
