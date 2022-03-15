import 'package:flutter/material.dart';
import 'package:hourse_life/pages/home_page/provider_home_page.dart';
import 'package:hourse_life/pages/profile/profile_screen.dart';
import '../../componant/profile_pic.dart';

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
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => providerHomePage()));
          },
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
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text('الأسم',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400))
                  ],
                ),

                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'اسم المستخدم ',
                    hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(139, 144, 150, 1)),
                  prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),


                Row(
                  children: [
                    Text('رقم الهوية',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400))
                  ],
                ),

                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'رقم الهوية ',
                    hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(139, 144, 150, 1)),
                    prefixIcon: const Icon(Icons.credit_card),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Row(
                  children: [
                    Text('رقم الجوال',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400))
                  ],
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'رقم الجوال ',
                    hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(139, 144, 150, 1)),
                    prefixIcon: const Icon(Icons.phone_android_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Row(
                  children: [
                    Text('كلمة السر',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400))
                  ],
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password_rounded),
                    hintText: 'كلمة السر',
                    hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(139, 144, 150, 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 349,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfileScreen(),
                        ),
                      );
                    },

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'حفظ البيانات',
                        style: TextStyle(fontSize: 18,fontFamily: 'Cairo',color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(

                      primary: Color.fromRGBO(72, 175, 218, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
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
