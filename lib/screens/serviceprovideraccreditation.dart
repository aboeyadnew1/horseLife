import 'package:admin_life_horse/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ServiceProviderAccreditation extends StatefulWidget {
  const ServiceProviderAccreditation({Key? key}) : super(key: key);

  @override
  _ServiceProviderAccreditationState createState() =>
      _ServiceProviderAccreditationState();
}

class _ServiceProviderAccreditationState
    extends State<ServiceProviderAccreditation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Color.fromRGBO(100, 192, 229, 1),
        elevation: 0,
        foregroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: 354,
                  height: 94,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.amber),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('الأسم'),
                          Text('الوظيفة'),
                          Text('العنوان'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
