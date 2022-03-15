import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hourse_life/componant/profile_pic.dart';
import 'package:hourse_life/componant/profilemenu.dart';

import 'edit_profile_data_screen.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        SizedBox(
          height: 20.0,
        ),
        ProfilePic(),
        Text('خالد عبدالله'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              color: Color.fromRGBO(72, 175, 218, 1),
            ),
            Text(
              'تعديل',
              style: TextStyle(color: Color.fromRGBO(72, 175, 218, 1)),
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        ProfileMenu(
          icons: (Icons.home_repair_service),
          text: "الخدمات المقدمة",
          press: (){},
      ),
        ProfileMenu(
          icons: (Icons.person_pin),
          text: " بيانات الحساب",
          press: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditUserData()));

          },
        ), ProfileMenu(
          icons: (Icons.shopping_cart_outlined),
          text: "الطلبات السابقة",
          press: (){},
        ), ProfileMenu(
          icons: (FontAwesome.bar_chart),
          text: "الفواتير ",
          press: (){},
        ), ProfileMenu(
          icons: (Icons.logout),
          text: "تسجيل الخروج",
          press: (){},
        ),
    ]));
  }
}
