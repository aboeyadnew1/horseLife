import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:hourse_life/pages/add_services.dart';
import 'package:hourse_life/widgets/bottom_navigation_bar.dart';
import 'package:hourse_life/widgets/drawer.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.blue,
          title: Row(
            children: [],
          ),),
      drawer: myDrawer(),
      bottomNavigationBar: myBottomNavBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تم الاعتماد بنجاح',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(72, 175, 218, 1),
                fontFamily: 'Cairo',
              ),
            ),
            Text('لا توجد بيانات',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Color.fromRGBO(139, 144, 150, 1),
                  fontFamily: 'Cairo',
                )),
            SizedBox(
              width: 281,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => newService()));
                },
                child: Text(
                  'تسجيل خدمة جديدة',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  primary: Color.fromRGBO(72, 175, 218, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
