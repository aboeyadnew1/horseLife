// ignore_for_file: unused_import, camel_case_types, use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hourse_life/map/map_page.dart';
import 'package:hourse_life/models/user.dart';
import 'package:hourse_life/pages/home_page/home.dart';
import 'package:search_choices/search_choices.dart';

import 'registration_done.dart';

class providerNewAccount extends StatefulWidget {
  @override
  _providerNewAccountState createState() => _providerNewAccountState();
}

class _providerNewAccountState extends State<providerNewAccount> {
  TextEditingController txtName = TextEditingController();
  var txtPhone = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  var tax_num = TextEditingController();
  var txtIdentity_num = TextEditingController();
  var txtAddress = TextEditingController();
  var txtJob = TextEditingController();
  var lat;
  var lng;

  var vendorCollection = FirebaseFirestore.instance.collection('Vendors');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  'images/photo1.png',
                  width: 112,
                  height: 125,
                ),
                Text(
                  'انشاء حساب جديد',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Color.fromRGBO(72, 175, 218, 1),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),

                inputItem('الاسم', txtName, "برجاء ادخال الاسم"),
                inputItem('رقم الجوال', txtPhone, "برجاء ادخال رقم الجوال"),
                inputItem('البريد الالكتروني', txtEmail,
                    "برجاء ادخال البريد الالكتروني"),
                inputItem(
                    'كلمة المرور', txtPassword, "برجاء ادخال كلمة المرور"),
                inputItem('رقم السجل', tax_num, "برجاء ادخال رقم السجل"),
                inputItem(
                    'رقم الهوية', txtIdentity_num, "برجاء ادخال رقم الهوية"),
                inputItem('العنوان', txtAddress, "برجاء ادخال العنوان"),
                SizedBox(
                  height: 20.0,
                ),
                inputItem('الوظيفة', txtJob, "برجاء ادخال الوظيفة"),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('اضافة الموقع من على الخريطة'),
                      InkWell(
                        child: Icon(Icons.add),
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => MapPage()))
                              .then((position) {
                            if (position != null) {
                              lat = position.latitude;
                              lng = position.longitude;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                // Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SizedBox(
                    width: 320,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Theme.of(context).primaryColorDark,
                          backgroundColor: Color.fromRGBO(100, 192, 229, 1)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          //validation on mail exists

                          var obj = await vendorCollection
                              .where('email', isEqualTo: txtEmail.text)
                              .get();

                          if (obj.size > 0) {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    content: Text(
                                        "هذا البريد الإلكتروني مستخدم من قبل !"),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: false)
                                                .pop('اغلاق');
                                          },
                                          child: Text('موافق')),
                                    ],
                                  );
                                });
                          } else {
                            DateTime now = DateTime.now();
                            String now_date = now.year.toString() +
                                now.month.toString() +
                                now.day.toString() +
                                now.hour.toString() +
                                now.minute.toString() +
                                now.second.toString() +
                                now.millisecond.toString() +
                                now.microsecond.toString();

                            var user = await vendorCollection.doc(now_date).set(
                                User(
                                        id: now_date,
                                        name: txtName.text,
                                        phone: txtPhone.text,
                                        email: txtEmail.text,
                                        password: txtPassword.text,
                                        tax_num: tax_num.text,
                                        identity_num: txtIdentity_num.text,
                                        address: txtAddress.text,
                                        job: txtJob.text,
                                        lat: lat,
                                        lng: lng,
                                        image: '')
                                    .toMap());

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationComplete(),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        'تسجيل',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Cairo'),
                      ),
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

  Widget inputItem(
      String text, TextEditingController controller, String validationMessage,
      {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: TextStyle(fontFamily: 'Cairo', fontSize: 18.0),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validationMessage;
              } else if (value.length < 3) {
                return "لا يمكن ادخال اقل من 3 حروف";
              }
              return null;
            },
            textAlign: TextAlign.center,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? InkWell(
                      // onTap: () {},
                      child: Icon(Icons.visibility),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.lightBlue,
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

//  decoration: InputDecoration(
//               suffixIcon: isPassword
//                   ? InkWell(
//                       onTap: () {},
//                       child: Icon(Icons.visibility),
//                     )
//                   : null,
//               contentPadding: EdgeInsets.symmetric(vertical: 12),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide:
//                       BorderSide(color: Color.fromRGBO(72, 175, 218, 1))),
//             ),
