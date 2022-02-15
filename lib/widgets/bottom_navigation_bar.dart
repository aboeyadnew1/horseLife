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
            icon: Icon(Icons.home), label: ('الرئيسية')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label:('الأعدادات')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label:('الملف الشخصى')),
      ],
    );
  }
}
