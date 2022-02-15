import 'package:flutter/material.dart';

class notificationsPage extends StatefulWidget {
  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          SizedBox(
            height: 40.0,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الاشعارات',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Cairo',
                          color: Color.fromRGBO(00, 192, 229, 1),
                          fontWeight: FontWeight.w700),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 90),
                    //   child: Icon(Icons.close),
                    // // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.circle,
                            color: Color.fromRGBO(100, 192, 229, 1),
                          ),
                        ),
                        Text('طلب جديد على خدمة صيدلية حسام      '),

                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: Icon(Icons.close),
                        ),
                      ],
                    ),

                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 2.0,color: Colors.black,thickness: 1.0,),
                  )
                ],
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
