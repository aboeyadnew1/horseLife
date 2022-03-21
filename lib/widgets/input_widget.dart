import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {

String txt;
bool isPassword;

InputWidget(String this.txt  , this.genralCont,this.isPassword);
var genralCont ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(txt),
          ),
          TextField(
            controller: genralCont,
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {},
                      child: Icon(Icons.visibility),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Color.fromRGBO(72, 175, 218, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}