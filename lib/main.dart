import 'dart:convert';
import 'package:betgame/Constants/ThemeColors.dart';
import 'package:betgame/Models/user.dart';
import 'package:betgame/Services/auth_service.dart';
import 'package:betgame/StateControllers/tab_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
      home: Main(),
      getPages: [
        GetPage(name: '/Home-Page', page: () => Home()),
      ],
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final TabState _tabController = Get.put(TabState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
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
              flex: 5,
              child: Column(
                children: [
                  customizeTabBar(),
                  Obx(() {
                    return _tabController.index.value == 0
                        ? Column(
                            children: [
                              SizedBox(height: 40),
                              userInput(context, 'Username', false),
                              SizedBox(height: 40),
                              userInput(context, 'Password', true),
                              SizedBox(height: 40),
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
    );
  }

  Widget customizeTabBar() {
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

  Widget userInput(BuildContext context, String placeholder, bool hide) {
    return TextField(
      obscureText: hide,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: placeholder,
      ),
    );
  }

  Widget themeButton(
      BuildContext context, String text, Size size, Color color) {
    return ElevatedButton(
      onPressed: () => Get.off(Home()),
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: size,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> items = [Text('data'), Text('data'), Text('data')];
  List<CategoryBar> cateItems = [CategoryBar(), CategoryBar(), CategoryBar(), CategoryBar(), CategoryBar()];
  late Future<User> futureUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUser = HttpService().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: ThemeColors().supportColor,
                  child: Row(
                    children: List.generate(2, (index) => CategoryBar()),
                  ),
                ),
                _searchBar('Search User'),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        10,
                        (index) => _userItem(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FNavBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchBar(String searchTxt){
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

  Widget _userItem() {
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
                  Text("Sai Htet Myat Htut")
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
                  _demText('2D'),
                  Container(
                    width: 65,
                    height: 15,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _demText('Type'),
                        _demText('Agent'),
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

  Widget _demText(String txt) {
    return Text(
      txt,
      style: TextStyle(fontSize: 10,color: ThemeColors().primarySuport,fontWeight: FontWeight.bold,letterSpacing:1),
    );
  }
}

class CategoryBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColors().supportColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_basketball,color: ThemeColors().primarySuport,),
            Text('',style: TextStyle(color: ThemeColors().primarySuport),)
          ],
        ),
      ),
    );
  }
}


class FNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 75,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
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
                  children: [
                    _menuItem(),
                    _menuItem(),
                    _menuItem(),
                    _menuItem(),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _menuItem() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1),
        height: 100,
        child: Center(
          child: Icon(
            Icons.sports_baseball,
            color: Colors.white,
          ),
        ),
      ),
      flex: 1,
    );
  }
}
