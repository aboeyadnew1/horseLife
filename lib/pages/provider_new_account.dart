// ignore_for_file: unused_import, camel_case_types, use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/models/user.dart';
import 'package:hourse_life/pages/home.dart';
import 'package:hourse_life/services/static_data.dart';
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
  var txtRecordNumber = TextEditingController();
  var txtPersonalIdentity = TextEditingController();
  var txtAddress = TextEditingController();
  var txtJob = TextEditingController();

  var firestore = FirebaseFirestore.instance.collection('users');
  String selectedValue = "الاول";

  final List<DropdownMenuItem> items = [
    new DropdownMenuItem(child: Text("طبية"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              inputItem('الاسم', txtName),
              inputItem('رقم الجوال', txtPhone),
              inputItem('البريد الالكتروني', txtEmail),
              inputItem('كلمة المرور', txtPassword),
              inputItem('رقم السجل', txtRecordNumber),
              inputItem('رقم الهوية', txtPersonalIdentity),
              inputItem('العنوان', txtAddress),
              SizedBox(
                height: 20.0,
              ),
              inputItem('الوظيفة', txtJob),
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
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              //المفروض دروب داون
              _builddropDown(items, "اختار الخدمة الرئيسية", selectedValue),
              SizedBox(height: 10.0,),
              _builddropDown(items, "اختار الخدمة الفرعية", selectedValue),

              //inputItem('نوع الخدمة الرئيسية'),
              SizedBox(
                height: 10.0,
              ),
              //inputItem('نوع الخدمة الفرعية'), // هنا كمان والنبي بس مش عارف اعمله
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
                      {
                        var user = await firestore.add(User(
                                name: txtName.text,
                                phone: txtPhone.text,
                                email: txtEmail.text,
                                password: txtPassword.text,
                                recordNumber: txtRecordNumber.text,
                                personalIdentity: txtPersonalIdentity.text,
                                address: txtAddress.text,
                                job: txtJob.text,
                                lat: '0',
                                long: '0')
                            .toMap());

                        var doc = await user.get();
                        setUserId(doc.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationComplete(),
                          ),
                        );
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
    );
  }

  Widget inputItem(String text, TextEditingController controller,
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
          TextField(
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

  Widget _builddropDown(
      List<DropdownMenuItem> items, String hint, String Selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          
            border: Border.all(
              
          color: Colors.black38,
          width: 1,
        )),
        child: SearchChoices.single(
          underline: SizedBox(),
          items: items,
          value: Selected,
          hint: hint,
          searchHint: "اختار الخدمة الرئيسية",
          onChanged: (value) {
            setState(() {
              var selectedValue = value;
            });
          },
          closeButton: "الغاء",
          doneButton: "اختيار",
          displayItem: (item, selected) {
            return (Row(children: [
              selected
                  ? Icon(
                      Icons.radio_button_checked,
                      color: Colors.grey,
                    )
                  : Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.grey,
                    ),
              SizedBox(width: 7),
              Expanded(
                child: item,
              ),
            ]));
          },
          isExpanded: true,
        ),
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
