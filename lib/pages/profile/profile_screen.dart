import 'package:flutter/material.dart';
import 'package:hourse_life/pages/profile/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        backgroundColor: Color.fromRGBO(100, 192, 229, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: new Text(
          'الملف الشخصي',
          style: TextStyle(

              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo',
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(child: SafeArea(child: Body())),
    );
  }
}
