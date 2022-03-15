import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/models/massage.dart';
import 'package:hourse_life/old_complaints.dart';
import 'package:hourse_life/pages/home_page/provider_home_page.dart';
import 'package:hourse_life/services/static_data.dart';

class Complaints extends StatelessWidget {
  var firestore = FirebaseFirestore.instance.collection('VendorMassages');

  TextEditingController txtComplainTitle = TextEditingController();
  TextEditingController txtComplainBody = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 149,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Color.fromRGBO(100, 192, 229, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: new Text(
            'الشكــــاوى و المقترحـــات',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
                color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "عنوان الشكوى",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: 354,
                height: 48.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(72, 175, 218, 1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                    child: TextField(
                      controller: txtComplainTitle,
                      maxLines: 1,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'قم بكتابة عنوان الشكوى',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(220, 220, 220, 1), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txtComplainBody,
                      maxLength: 180,
                      maxLines: 3,
                      textAlign: TextAlign.right,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 17),
                        hintText: 'قم بكتابة نص الشكوى',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'الشكاوى السابقة',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(72, 175, 218, 1),
                        fontSize: 20.0,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OldComplaints()));
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      child: Text('أرسل'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(72, 175, 218, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: Size(0, 45),
                      ),
                      onPressed: () async {
                        {
                          if (txtComplainTitle.text.trim() == "" ||
                              txtComplainBody.text.trim() == "") {}

                          var massage = await firestore.add(Massage(
                            massage: txtComplainTitle.text,
                            description: txtComplainBody.text,
                            date: '',
                            vendor_id: '',
                            vendor_name: '',
                          ).toMap());

                          var doc = await massage.get();
                          setUserId(doc.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => providerHomePage(),
                            ),
                          );
                        }
                      },
                    ),
                  )),
            ]),
          ),
        ));
  }
}
