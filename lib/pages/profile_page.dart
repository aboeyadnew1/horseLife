import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/data/global_data.dart';
import 'package:hourse_life/models/user.dart';
import 'package:hourse_life/pages/home.dart';
import 'package:hourse_life/pages/provider_new_acc_section_tow.dart';
import 'package:hourse_life/services/static_data.dart';

import 'registration_done.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var txtName = TextEditingController();
  var txtPhone = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  var txtRecordNumber = TextEditingController();
  var txtPersonalIdentity = TextEditingController();
  var txtAddress = TextEditingController();
  var txtJob = TextEditingController();

  var firestore = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    txtName.text = GlobalData.user.name;
    txtPhone.text = GlobalData.user.phone;
    txtEmail.text = GlobalData.user.email;
    txtPassword.text = GlobalData.user.password;
    txtRecordNumber.text = GlobalData.user.recordNumber;
    txtPersonalIdentity.text = GlobalData.user.personalIdentity;
    txtAddress.text = GlobalData.user.address;
    txtJob.text = GlobalData.user.job;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'images/photo1.png',
                width: 112,
                height: 125,
              ),
              Text(
                'الملف الشخصى',
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
                  width: 354,
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
                        var user = User(
                            name: txtName.text,
                            email: txtEmail.text,
                            password: txtPassword.text,
                            job: txtJob.text,
                            address: txtAddress.text,
                            personalIdentity: txtPersonalIdentity.text,
                            phone: txtPhone.text,
                            recordNumber: txtRecordNumber.text,
                            lat: '0',
                            long: '0');

                        await firestore
                            .doc(GlobalData.userId)
                            .update(user.toMap());

                        GlobalData.user = user;
                      }

                      Spacer();
                    },
                    child: Center(
                      child: Text(
                        'تعديل',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Cairo'),
                      ),
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
