// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'second_intro.dart';

class Intro extends StatelessWidget {
  const Intro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'images/horse.png',
                  height: 349,
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                child: Text(
                  ' نسعى دائماً لتقديم أفضل الخدمات  ',
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                child: Text(
                  ' لحياة الخيل بأعلى جودة و أفضل سعر  ',
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),

          ],
        ),
      ),
      bottomSheet:  Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(bottom: 10,right: 10,left: 10),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondIntro()));

                  },
                  child: Text(
                    'التالى ',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(72, 175, 218, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: Size(170, 50),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 40,
                    child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                            color: Color.fromRGBO(72, 175, 218, 1),
                          ),
                          Icon(
                            Icons.circle,
                            size: 15,
                            color: Color.fromRGBO(72, 175, 218, 0.4),
                          ),
                        ],
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
}
