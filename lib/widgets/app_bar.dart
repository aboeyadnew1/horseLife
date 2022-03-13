import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget {
  String title;

   App_Bar({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back_ios,color: Colors.white,),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Color.fromRGBO(100, 192, 229, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      title: new Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Cairo',
            color: Colors.white),
      ),
      actions: [Image.asset("images/horse.png",)],
    );
  }
}
