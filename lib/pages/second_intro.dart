import 'package:flutter/material.dart';
import 'package:hourse_life/pages/login_screen.dart';
import 'package:hourse_life/pages/signin_or_options.dart';
import 'package:hourse_life/services/static_data.dart';

class SecondIntro extends StatelessWidget {
  const SecondIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Image.asset(
              "images/photo1.png",
              width: 120,
              height: 100,
            ),
            // Text(
            //   "حياة الخيل",
            //   style: TextStyle(fontSize: 25),
            // ),
            // Text(
            //   "HAYAT AL KHAIL",
            //   style: TextStyle(fontSize: 25),
            // ),
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'images/horse.png',
                  height: 349,
                )),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width:  MediaQuery.of(context).size.width,
              child:  FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'تم اختيار مقدمين خدمات الخيل من إستشارات طبية ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'و مواد غذائية للخيل و غيلاه مما يخص الخيل بعناية',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setIntro();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  },
                  child: Text(
                    'إبداء ',
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(72, 175, 218, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: Size(300, 50),
                  ),
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.circle,
                //       size: 15,
                //       color: Color.fromRGBO(72, 175, 218, 1),
                //     ),
                //     Icon(
                //       Icons.circle,
                //       size: 15,
                //       color: Color.fromRGBO(72, 175, 218, 0.4),
                //     ),
                //   ],
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
