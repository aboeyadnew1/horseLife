import 'package:flutter/material.dart';

class notificationsPage extends StatefulWidget {
  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(children: [
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.close),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الاشعارات',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Cairo',
                          color: Color.fromRGBO(00, 192, 229, 1),
                          fontWeight: FontWeight.w700),
                    ),
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
                      children: [
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('طلب جديد على خدمة صيدلية حسام      '),
                        Icon(
                          Icons.circle,
                          color: Color.fromRGBO(100, 192, 229, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
