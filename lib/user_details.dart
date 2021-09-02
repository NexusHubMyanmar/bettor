import 'package:betgame/Constants/ThemeColors.dart';
import 'package:betgame/Widgets/PotatoAppBar/potato_appbar.dart';
import 'package:betgame/Widgets/UserListView/user_list_view.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PotatoAppBar(),
            CurcularImage(),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'Elon Musk',
                style: TextStyle(fontSize: 24),
              ),
            ),
            UserAttributes(),
            Expanded(child: UserListView()),
          ],
        ),
      ),
    );
  }

  Widget CurcularImage() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(
                'https://static.dezeen.com/uploads/2021/06/elon-musk-architect_dezeen_1704_col_0.jpg'),
            fit: BoxFit.fill),
      ),
    );
  }

  Widget UserAttributes() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AttributeItem(),
          AttributeItem(),
          AttributeItem(),
          AttributeItem(),
        ],
      ),
    );
  }

  Widget AttributeItem() {
    return Container(
      width: 32,
      height: 32,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: ThemeColors().supportColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(
        '2D',
        style: TextStyle(color: ThemeColors().primarySuport),
      )),
    );
  }

  Widget UserListView() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => Container(
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
                    Text('Elon Musk')
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
                    DemText('2D'),
                    Container(
                      width: 65,
                      height: 15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DemText('Type'),
                          DemText('User'),
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
