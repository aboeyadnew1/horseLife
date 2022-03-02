import 'package:flutter/material.dart';
import 'package:hourse_life/pages/profile_screen.dart';
import '../componant/profile_pic.dart';

class EditUserData extends StatefulWidget {
  const EditUserData({Key key}) : super(key: key);

  @override
  _EditUserDataState createState() => _EditUserDataState();
}

class _EditUserDataState extends State<EditUserData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'بيانات المستخدم',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo',
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                ProfilePic(),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('الأسم',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    width: 349,
                    height: 60.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'اسم المستخدم ',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromRGBO(139, 144, 150, 1)),
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('رقم الجوال',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    width: 349,
                    height: 60.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'رقم الجوال ',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromRGBO(139, 144, 150, 1)),
                        suffixIcon: const Icon(Icons.phone_android_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('كلمة السر',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    width: 349,
                    height: 60.0,
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.password_rounded),
                        hintText: 'كلمة السر',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromRGBO(139, 144, 150, 1)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: 349,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfileScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'حفظ البيانات',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(72, 175, 218, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: Size(0, 45),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
