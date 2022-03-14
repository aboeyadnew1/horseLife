import 'package:flutter/material.dart';
import 'package:hourse_life/pages/home_page/home.dart';
import 'package:hourse_life/pages/login_screen.dart';
import 'package:hourse_life/pages/orders_pages/purchaseorders.dart';
import 'package:hourse_life/pages/products.dart';
import 'package:hourse_life/pages/profile/profile_screen.dart';

import '../../services/static_data.dart';
import '../complaints _page.dart';

class UserControlPanel extends StatefulWidget {
  const UserControlPanel({Key key}) : super(key: key);

  @override
  _UserControlPanelState createState() => _UserControlPanelState();
}

class _UserControlPanelState extends State<UserControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (builder) => Home()));
          },
        ),
        backgroundColor: Color.fromRGBO(100, 192, 229, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: new Text(
          'لوحة التحكم',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo',
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
            // Column(children: [
            //   Row(
            //     children: [
            //       Image.asset(
            //         'images/servicesicon.png',
            //         width: 25,
            //         height: 25,
            //       ),
            //       SizedBox(
            //         width: 10.0,
            //       ),
            //       Text(
            //         'الخدمات المقدمة',
            //         style: TextStyle(
            //             fontSize: 16.0,
            //             fontFamily: 'Cairo',
            //             fontWeight: FontWeight.w400),
            //       ),
            //     ],
            //   ),
            // ]),
            // SizedBox(
            //   height: 30.0,
            // ),
            // Divider(
            //   height: 1.0,
            //   color: Colors.blue,
            // ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ProfileScreen())),
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
                    'بيانات الحساب',
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
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'الطلبات السابقة',
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
                        builder: (context) => PurchaseOrders()));
              },
            ),
            SizedBox(
              height: 30.0,
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
                      builder: (context) => produts(),
                    ));
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(height: 25.0),
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
                    Image.asset(
                      'images/billicon.png',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'الفواتير',
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
            Divider(
              height: 1.0,
              color: Colors.blue,
            ),
            SizedBox(height: 25.0),
            InkWell(
                onTap: () {
                  removeUserId();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                      (route) => false);
                },
                child: InkWell(
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
                    onTap: () {
                      {
                        removeUserId();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInScreen()),
                            (route) => false);
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
