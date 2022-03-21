import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.press,
    this.icons,
    this.FontAwesomeIcons,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final IconData icons;
  final FontAwesomeIcons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Color(0XFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            Icon(icons),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(text),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
