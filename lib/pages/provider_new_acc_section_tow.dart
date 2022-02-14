import 'package:flutter/material.dart';
import 'package:hourse_life/pages/home.dart';
import 'package:hourse_life/widgets/dropdown.dart';
import 'package:hourse_life/pages/registration_done.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class providerNewAccountSectionTwo extends StatefulWidget {
  @override
  _providerNewAccountSectionTwoState createState() =>
      _providerNewAccountSectionTwoState();
}

class _providerNewAccountSectionTwoState
    extends State<providerNewAccountSectionTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
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
              inputItem('العنوان'),
              SizedBox(
                height: 20.0,
              ),
              inputItem('الوظيفة'),
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
              inputItem('نوع الخدمة الرئيسية'),
              SizedBox(
                height: 10.0,
              ),
              inputItem(
                  'نوع الخدمة الفرعية'), // هنا كمان والنبي بس مش عارف اعملها
              // SizedBox(
              //   height: 20.0,
              // ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: 354,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Theme.of(context).primaryColorDark,
                      backgroundColor: Color.fromRGBO(100, 192, 229, 1),
                    ),
                    onPressed: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }
                      ;
                    },
                    child: Center(
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
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputItem(String text, {bool isPassword = false}) {
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
        ],
      ),
    );
  }
}
