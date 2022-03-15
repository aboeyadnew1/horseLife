import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/pages/provider_new_account.dart';
import 'package:hourse_life/pages/sign_in_page.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/photo1.png',
                height: 120,
                width: 120,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'تسجيل الدخول',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(72, 175, 218, 1),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: 347.0,
                  height: 50.0,
                  child: TextField(
                    textAlign: TextAlign.right,
                    autofocus: true,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: "رقم الجوال",
                        labelStyle: TextStyle(fontSize: 22),
                        hintText: "يرجى ادخال رقم الجوال"),
                  ),
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
              Column(
                children: [
                  Container(
                    width: 347.0,
                    height: 50.0,
                    // child: TextField(
                    //   obscureText: isHiddenPassword,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //     ),

                    //     hintText: 'كلمة المرور',
                    //     suffixIcon: InkWell(
                    //       onTap: _togglePasswordView,
                    //       child: Icon(Icons.visibility),
                    //     ),
                    //   ),
                    // ),

                    child: TextField(
                      textDirection: TextDirection.rtl,
                      autofocus: true,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: "كلمة المرور",
                          labelStyle: TextStyle(fontSize: 22),
                          hintText: "يرجى ادخال كلمة المرور"),
                    ),
                  ),
                ],
              ),
              FlatButton(onPressed: () {}, child: Text('هل نسيت كلمة المرور')),
              //   Text('هل نسيت كلمة المرور؟'),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => providerNewAccount(),
                    ),
                  );
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF48AFDA),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  fixedSize: const Size(347, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
