// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/pages/complaints%20_page.dart';
import 'package:hourse_life/pages/login_screen.dart';
import 'package:hourse_life/pages/orders_pages/purchaseorders.dart';
import 'package:hourse_life/pages/profile/edit_profile_data_screen.dart';
import 'package:hourse_life/pages/profile/profile_screen.dart';
import 'package:hourse_life/share/cache_helper.dart';

import '../pages/Services.dart';

class myDrawer extends StatefulWidget {
  @override
  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30.0,
            ),
            uid.image != null
                ? Image.network(
                    uid.image,
                    width: 100,
                    height: 50.0,
                  )
                : Image.asset(
                    'images/profile.png',
                    width: 100,
                    height: 50.0,
                  ),
            Center(
              child: Text(uid.name != null ? uid.name : " مستخدم"),
            ),
            SizedBox(
              height: 15.0,
            ),
            SizedBox(height: 15.0),
            SizedBox(height: 15.0),
            Column(children: [
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/personicon.png',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'الحساب الشخصي',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditUserData()));
                },
              ),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(children: [
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Color.fromRGBO(72, 175, 218, 1),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'المنتجات',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Services(),
                      ));
                },
              ),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Color.fromRGBO(72, 175, 218, 1),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'الطلبات ',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurchaseOrders()));
              },
            ),
            SizedBox(height: 15.0),
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(height: 15.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PurchaseOrders(),
                  ),
                );
              },
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.report_problem_outlined,
                      color: Color.fromRGBO(72, 175, 218, 1),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'الشكاوى',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Complaints(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(height: 15.0),
            InkWell(
              onTap: () {
                CacheHelper.setModelData(key: kUid, data: null).then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                      (route) => false);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.login_outlined,
                    color: Color.fromRGBO(72, 175, 218, 1),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
