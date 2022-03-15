import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/pages/complaints%20_page.dart';

class OldComplaints extends StatefulWidget {
  const OldComplaints({Key key}) : super(key: key);

  @override
  _OldComplaintsState createState() => _OldComplaintsState();
}

class _OldComplaintsState extends State<OldComplaints> {
  var firebase = FirebaseFirestore.instance.collection('users');
  QuerySnapshot users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    users = await firebase.where('visable', isEqualTo: true).get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 149,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) => Complaints()));
            },
          ),
          backgroundColor: Color.fromRGBO(100, 192, 229, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: new Text(
            'الشكاوى السابقة',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
                color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 29.0,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 354,
                          height: 240,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(72, 175, 218, 1),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //first section
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'عنوان الشكوى',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'وصف الشكوى',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'مقدمة من',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'رقم الشكوى',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //End offirst section
                                  //Start  of Second Section of Card
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 10.0),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 55.0),
                                      width: 103.0,
                                      height: 90.0,
                                      child: Column(
                                        children: [
                                          Text(
                                            '14 فبراير',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //End of Second Section of Card
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
