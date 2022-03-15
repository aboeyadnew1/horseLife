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
    oldComplaints = await firebase.where('vendor_id', isEqualTo: uid).get();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
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

        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //   child: oldComplaints == null
        //       ? CircularProgressIndicator()
        //       :
        //   SafeArea(
        //     child: SingleChildScrollView(
        //       child: Center(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             SizedBox(
        //               height: 29.0,
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 354,
        //                   height: 240,
        //                   decoration: BoxDecoration(
        //                     border: Border.all(
        //                       color: Color.fromRGBO(72, 175, 218, 1),
        //                     ),
        //                     borderRadius: BorderRadius.circular(12.0),
        //                   ),
        //                   child: Column(
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           //first section
        //                           Padding(
        //                             padding: const EdgeInsets.only(right: 10.0),
        //                             child: Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               children: [
        //
        //                                 Row(
        //                                   children: [
        //                                     Text(
        //                                       'عنوان الشكوى',
        //                                       style: TextStyle(
        //                                         fontSize: 18.0,
        //                                         fontFamily: 'Cairo',
        //                                         fontWeight: FontWeight.w500,
        //                                       ),
        //                                     ),
        //                                     Text(
        //                                       (oldComplaints.docs[index].data() as Map)['name'],
        //                                       style: TextStyle(
        //                                         fontFamily: 'Cairo',
        //                                         fontSize: 15.0,
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 Text(
        //                                   'وصف الشكوى',
        //                                   style: TextStyle(
        //                                     fontSize: 18.0,
        //                                     fontFamily: 'Cairo',
        //                                     fontWeight: FontWeight.w500,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   'مقدمة من',
        //                                   style: TextStyle(
        //                                     fontSize: 18.0,
        //                                     fontFamily: 'Cairo',
        //                                     fontWeight: FontWeight.w500,
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   'رقم الشكوى',
        //                                   style: TextStyle(
        //                                     fontSize: 18.0,
        //                                     fontFamily: 'Cairo',
        //                                     fontWeight: FontWeight.w500,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                           //End offirst section
        //                           //Start  of Second Section of Card
        //                           Padding(
        //                             padding: const EdgeInsets.only(
        //                                 left: 10.0, top: 10.0),
        //                             child: Container(
        //                               margin: EdgeInsets.only(bottom: 55.0),
        //                               width: 103.0,
        //                               height: 90.0,
        //                               child: Column(
        //                                 children: [
        //                                   Text(
        //                                     '14 فبراير',
        //                                     style: TextStyle(
        //                                         fontFamily: 'Cairo',
        //                                         fontSize: 20.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ),
        //                           //End of Second Section of Card
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20.0,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 20.0,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),


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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    (oldComplaints.docs[index].data() as Map)['date'],
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'Cairo',
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ]),

                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         '  رقم السجل : ',
                          //         style: TextStyle(
                          //             fontFamily: 'Cairo',
                          //             fontSize: 15.0,
                          //             fontWeight: FontWeight.bold,
                          //             color:
                          //             Color.fromRGBO(72, 175, 218, 1)),
                          //       ),
                          //       Text(
                          //         (users.docs[index].data()
                          //         as Map)['recordNumber'] ??
                          //             "empty",
                          //         style: TextStyle(
                          //           fontFamily: 'Cairo',
                          //           fontSize: 15.0,
                          //         ),
                          //       ),
                          //     ]),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         '  رقم الهوية : ',
                          //         style: TextStyle(
                          //             fontFamily: 'Cairo',
                          //             fontSize: 15.0,
                          //             fontWeight: FontWeight.bold,
                          //             color:
                          //             Color.fromRGBO(72, 175, 218, 1)),
                          //       ),
                          //       Text(
                          //         (users.docs[index].data()
                          //         as Map)['personalIdentity'] ??
                          //             "empty",
                          //         style: TextStyle(
                          //           fontFamily: 'Cairo',
                          //           fontSize: 15.0,
                          //         ),
                          //       ),
                          //     ]),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         '  العنوان : ',
                          //         style: TextStyle(
                          //             fontFamily: 'Cairo',
                          //             fontSize: 15.0,
                          //             fontWeight: FontWeight.bold,
                          //             color:
                          //             Color.fromRGBO(72, 175, 218, 1)),
                          //       ),
                          //       Text(
                          //         (users.docs[index].data()
                          //         as Map)['address'] ??
                          //             "empty",
                          //         style: TextStyle(
                          //           fontFamily: 'Cairo',
                          //           fontSize: 15.0,
                          //         ),
                          //       ),
                          //     ]),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 10.0),
                          //   child: Row(
                          //     mainAxisAlignment:
                          //     MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       SizedBox(
                          //         width: 155,
                          //         height: 50,
                          //         child: ElevatedButton(
                          //             style: ButtonStyle(
                          //               backgroundColor:
                          //               MaterialStateProperty.all(
                          //                 Color.fromRGBO(100, 192, 229, 1),
                          //               ),
                          //               shape: MaterialStateProperty.all<
                          //                   RoundedRectangleBorder>(
                          //                 RoundedRectangleBorder(
                          //                   borderRadius:
                          //                   BorderRadius.circular(15.0),
                          //                 ),
                          //               ),
                          //             ),
                          //             onPressed: () {
                          //               var doc = users.docs[index].data()
                          //               as Map<String, dynamic>;
                          //               doc['approved'] = true;
                          //               doc['visable'] = false;
                          //               firebase
                          //                   .doc(users.docs[index].id)
                          //                   .update(doc);
                          //               getData();
                          //             },
                          //             child: Text(
                          //               'تأكيد الأعتماد',
                          //               style: TextStyle(
                          //                   fontFamily: 'Cairo',
                          //                   fontSize: 15.0,
                          //                   fontWeight: FontWeight.w400),
                          //             )),
                          //       ),
                          //       SizedBox(
                          //         width: 155,
                          //         height: 50,
                          //         child: ElevatedButton(
                          //           style: ButtonStyle(
                          //             backgroundColor:
                          //             MaterialStateProperty.all(
                          //                 Colors.white),
                          //             shape: MaterialStateProperty.all<
                          //                 RoundedRectangleBorder>(
                          //               RoundedRectangleBorder(
                          //                   borderRadius:
                          //                   BorderRadius.circular(15.0),
                          //                   side: BorderSide(
                          //                       color: Color.fromRGBO(
                          //                           72, 175, 218, 1))),
                          //             ),
                          //           ),
                          //           onPressed: () {
                          //             var doc = users.docs[index];
                          //             firebase.doc(doc.id).delete();
                          //             getData();
                          //           },
                          //           child: Text(
                          //             'رفض الأعتماد',
                          //             style: TextStyle(
                          //                 fontSize: 15.0,
                          //                 fontWeight: FontWeight.w400,
                          //                 fontFamily: 'Cairo',
                          //                 color: Color.fromRGBO(
                          //                     100, 192, 229, 1)),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
