import 'package:flutter/material.dart';
import 'package:hourse_life/pages/complaints%20_page.dart';
import 'package:hourse_life/pages/login_screen.dart';
import 'package:hourse_life/pages/profile_screen.dart';
import 'package:hourse_life/pages/trackpurchaseorders.dart';
import 'package:hourse_life/services/static_data.dart';
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
              height: 40.0,
            ),
            Image.asset(
              'images/profile.png',
              width: 100,
              height: 50.0,
            ),
            Center(child: Text('عبدالله خالد')),
            SizedBox(
              height: 20.0,
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.dashboard,
                    color: Color.fromRGBO(72, 175, 218, 1),
                  ),
                  Text(
                    'لوحة التحكم',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 25.0,
            ),
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(height: 25.0),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Color.fromRGBO(72, 175, 218, 1),
                  ),
                  Text(
                    'تتبع عملية الشراء',
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
                        builder: (context) => trackPurchaseOrders()));
              },
            ),
            // SizedBox(
            //   height: 30.0,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Icon(
            //       Icons.shopping_bag,
            //       color: Color.fromRGBO(72, 175, 218, 1),
            //     ),
            //     Text(
            //       'المنتجات',
            //       style: TextStyle(
            //           fontSize: 16.0,
            //           fontFamily: 'Cairo',
            //           fontWeight: FontWeight.w400),
            //     ),
            //   ],
            // ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => trackPurchaseOrders(),
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
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.credit_card,
                  color: Color.fromRGBO(72, 175, 218, 1),
                ),
                Text(
                  'الدفع',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.settings,
                  color: Color.fromRGBO(72, 175, 218, 1),
                ),
                Text(
                  'الضبط',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ProfileScreen())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_pin,
                    color: Color.fromRGBO(72, 175, 218, 1),
                  ),
                  Text(
                    'الملف الشخصي',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                removeUserId();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                    (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.login_outlined,
                    color: Color.fromRGBO(72, 175, 218, 1),
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
            )
          ],
        ),
      ),
    );
  }
}
