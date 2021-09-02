import 'package:betgame/Constants/ThemeColors.dart';
import 'package:flutter/material.dart';

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
