import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/componant/contants.dart';
import 'package:hourse_life/models/user.dart';
import 'package:hourse_life/pages/home_page/home.dart';
import 'package:hourse_life/pages/home_page/provider_home_page.dart';
import 'package:hourse_life/pages/provider_new_account.dart';
import 'package:hourse_life/pages/registration_done.dart';
import 'package:hourse_life/pages/sign_in_page.dart';
import 'package:hourse_life/services/api_provider.dart';
import 'package:hourse_life/services/static_data.dart';
import 'package:hourse_life/share/cache_helper.dart';

class LogInScreen extends StatefulWidget {
  static String id = 'login';
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var firestore = FirebaseFirestore.instance.collection('Vendors');

  ApiProvider provider = ApiProvider();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isHiddenPassword = true;

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
              SizedBox(
                height: 30,
              ),
              Text(
                "تسجيل دخول",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 25,
                    color: Color.fromRGBO(72, 175, 218, 1),
                    fontWeight: FontWeight.bold),
              ),
              inputItem('رقم الجوال', txtPhone),
              inputItem('كلمة المرور ', txtPassword, isPassword: true),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      var data = await firestore
                          .where('phone', isEqualTo: txtPhone.text)
                          .where('password', isEqualTo: txtPassword.text)
                          .get();

                      if (data.docs.isNotEmpty) {
                        // set userid in shared preference
                        var userDoc = data.docs.first;
                        setUserId(userDoc.id);
                        CacheHelper.setData(key: kUid, value: userDoc.id);
                        Center(child: CircularProgressIndicator());
                        //go to home
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => providerHomePage()));
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
                      }
                    },
                    child: Text('ابدء الأن '),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(72, 175, 218, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: Size(0, 45),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => providerNewAccount()));
                        },
                        child: Text('ليس لديك حساب ! سجل الآن '),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(72, 175, 218, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          fixedSize: Size(0, 45),
                        ),
                      ),
                    ),
                  ),
                ],
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
            // textAlign: TextAlign.center,
            controller: txtControl,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 10, 15),
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {},
                      child: Icon(Icons.visibility),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Color.fromRGBO(72, 175, 218, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
