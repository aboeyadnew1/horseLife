import 'package:flutter/material.dart';

class RegistrationComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //         //   onTap: () {
            //         //     Navigator.push(context, MaterialPageRoute(builder:  (context) =>addNewService()));
            //         //   },
            // ),
            Image.asset(
              'images/complete.png',
              width: 190.22,
              height: 190.22,
            ),

            Text(
              'تم استلام طلبك',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Cairo'),
            ),
            Text(
              'جاري الاعتماد',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Cairo'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Color.fromRGBO(74, 212, 113, 1),
                ),
                Icon(
                  Icons.circle,
                  color: Color.fromRGBO(74, 212, 113, 0.4),
                ),
                Icon(
                  Icons.circle,
                  color: Color.fromRGBO(74, 212, 113, 0.4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
