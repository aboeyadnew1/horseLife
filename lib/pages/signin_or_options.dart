import 'package:flutter/material.dart';
import 'package:hourse_life/models/user.dart';
import 'package:hourse_life/pages/home.dart';
import 'package:hourse_life/pages/login_screen.dart';
import 'package:hourse_life/pages/sign_in_page.dart';
import 'package:hourse_life/services/api_provider.dart';

class SignInOrSignUP extends StatelessWidget {
  ApiProvider provider = ApiProvider();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/photo1.png",
                width: 120,
                height: 120,
              ),
              // Text(
              //   "حياة الخيل",
              //   style: TextStyle(fontSize: 25),
              // ),
              // Text(
              //   "HAYAT AL KHAIL",
              //   style: TextStyle(fontSize: 25),
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                "تسجيل دخول",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromRGBO(72, 175, 218, 1),
                    fontWeight: FontWeight.bold),
              ),
              inputItem('رقم الجوال', txtPhone),
              inputItem('كلمة المرور ', txtPassword, isPassword: true),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      //provider.login(User(txtPhone.text, txtPassword.text))
                      if (true == true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                content: Text(
                                    "البيانات التى ادخلتها غير صحيحة برجاء المحاولة مرة اخر"),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text('موافق'))
                                ],
                              );
                            });
                        txtPhone.clear();
                        txtPassword.clear();
                      }
                    },
                    child: Text('تسجيـل الدخـول'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(72, 175, 218, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: Size(0, 45),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text('او'),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    )),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('الدخول عن طريق فيسبوك'),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'images/facebook.png',
                            height: 20,
                            width: 20,
                          ),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(71, 111, 176, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: Size(0, 45),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'الدخول عن طريق جوجل',
                          style: TextStyle(color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(
                            'images/google.png',
                            height: 20,
                            width: 20,
                          ),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: Color.fromRGBO(72, 175, 218, 1))),
                      fixedSize: Size(0, 45),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputItem(String text, TextEditingController txtControl,
      {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(text),
          ),
          TextField(
            controller: txtControl,
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {},
                      child: Icon(Icons.visibility),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Color.fromRGBO(72, 175, 218, 1),
                ),
              ),
            ),
          ),
          isPassword ? Text('هل نسيت كلم المرور؟') : Container(),
        ],
      ),
    );
  }
}
