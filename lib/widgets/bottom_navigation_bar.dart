import 'package:flutter/material.dart';

class myBottomNavBar extends StatefulWidget {
  @override
  _myBottomNavBarState createState() => _myBottomNavBarState();
}

class _myBottomNavBarState extends State<myBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text('الرئيسية')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('الأعدادات')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('الملف الشخصى')),
      ],
    );
  }
}
