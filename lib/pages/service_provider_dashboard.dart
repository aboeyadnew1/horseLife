import 'package:flutter/material.dart';
import 'package:hourse_life/widgets/bottom_navigation_bar.dart';
import 'package:hourse_life/widgets/drawer.dart';

class providerDashBoard extends StatefulWidget {
  @override
  _providerDashBoardState createState() => _providerDashBoardState();
}

class _providerDashBoardState extends State<providerDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.notifications,
                color: Color.fromRGBO(72, 175, 218, 1),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'images/photo1.png',
                  width: 250.0,
                  height: 100.0,
                ),
              ),
            ],
          )),
      drawer: myDrawer(),
      bottomNavigationBar: myBottomNavBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
