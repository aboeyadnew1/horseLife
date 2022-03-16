// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/pages/complaints%20_page.dart';

class OldComplaints extends StatefulWidget {
  const OldComplaints({Key key}) : super(key: key);

  @override
  _OldComplaintsState createState() => _OldComplaintsState();
}

class _OldComplaintsState extends State<OldComplaints> {
  var firebase = FirebaseFirestore.instance.collection('VendorMassages');
  QuerySnapshot oldComplaints;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    oldComplaints = await firebase.where('vendor_id', isEqualTo: uid.id).get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
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
        body: SafeArea(
          child: oldComplaints == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: oldComplaints.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color.fromRGBO(72, 175, 218, 1),
                                  //                   <--- border color
                                  width: 1.0),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          (oldComplaints.docs[index].data()
                                                  as Map)['massage'] ??
                                              "empty",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    (oldComplaints.docs[index].data()
                                            as Map)['description'] ??
                                        "empty",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          (oldComplaints.docs[index].data()
                                              as Map)['date'],
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Cairo',
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
        // );
      ),
    );
  }
}
