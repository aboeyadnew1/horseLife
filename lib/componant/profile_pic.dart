import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.0,
      width: 115.0,
      child:
          Stack(fit: StackFit.expand, overflow: Overflow.visible, children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/profile.png'),
        ),
        Positioned(
          right: -12,
          bottom: 0,
          child: SizedBox(
              height: 46.0,
              width: 46.0,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0XFFF5F6F9),
                onPressed: () {},
                child: Icon(Icons.camera_alt_outlined),
              )),
        )
      ]),
    );
  }
}