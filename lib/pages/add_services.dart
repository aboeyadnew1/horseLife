// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/models/MainService.dart';
import 'package:hourse_life/models/SubService.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/services/Store.dart';
import 'package:hourse_life/services/shared_prefrerence_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'home_page/provider_home_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class newService extends StatefulWidget {
  @override
  _newServiceState createState() => _newServiceState();
}

class _newServiceState extends State<newService> {
  File _image;
  String _uploadedFileURL;
  String now_date;

  var txtName = TextEditingController();
  var textDescription = TextEditingController();
  var textQuantity = TextEditingController();
  var textPrice = TextEditingController();
  var textDeliveryMethod = TextEditingController();
  var textDeliveryTime = TextEditingController();

  List<MainService> mainservices = [];
  List<SubService> subservices = [];

  final _store = new Store();

  final List<String> items = [];
  final List<String> items2 = [];
  final List<String> items_2 = [];

  final List<String> items_id = [];
  final List<String> items_id2 = [];

  String selectedmainValue = '';
  String selectedsubValue = '';

  var firestore = FirebaseFirestore.instance.collection('service');

  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);

    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadMainServices(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                items.clear();
                items_id.clear();
                mainservices.clear();
                for (var doc in snapshot.data.docs) {
                  mainservices.add(
                      MainService(id: doc.reference.id, name: doc.get("text")));
                  items.add(doc.get("text"));
                  items_id.add(doc.reference.id);
                }
              }
              return StreamBuilder<QuerySnapshot>(
                  stream: _store.loadSubService(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      items2.clear();
                      items_id2.clear();
                      subservices.clear();
                      for (var doc in snapshot.data.docs) {
                        subservices.add(SubService(
                            id: doc.reference.id,
                            name: doc.get("text"),
                            main_id: doc.get("main_id")));
                        items2.add(doc.get("text"));
                        items_id2.add(doc.reference.id);
                      }
                    }
                    return SingleChildScrollView(
                      child: SafeArea(
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/photo1.png',
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            'تسجيل خدمة جديدة',
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  72, 175, 218, 1),
                                            ),
                                          ),
                                          // Icon(
                                          //   Icons.arrow_back_ios_new,
                                          //   color:
                                          //       Color.fromRGBO(72, 175, 218, 1),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 20.0,
                                ),

                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: DropdownSearch<String>(
                                        mode: Mode.BOTTOM_SHEET,
                                        showSearchBox: true,
                                        showSelectedItem: true,
                                        hint: "search",
                                        items: items,
                                        label: "نوع الخدمة الرئيسية ",
                                        onChanged: (value) {
                                          print(value);
                                          setState(() {
                                            selectedmainValue = value;
                                          });
                                          get_sub_main_id(
                                              selectedmainValue, mainservices);
                                        },
                                        //show selected item
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: DropdownSearch<String>(
                                        mode: Mode.BOTTOM_SHEET,
                                        showSearchBox: true,
                                        showSelectedItem: true,
                                        items: items_2,
                                        label: "نوع الخدمة الفرعية ",
                                        onChanged: (value) {
                                          print(value);
                                          setState(() {
                                            selectedsubValue = value;
                                          });
                                        },
                                        //show selected item
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'عنوان الخدمة',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 0.5),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextField(
                                          // textAlign: TextAlign.center,
                                          controller: txtName,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                15.0, 10.0, 0.0, 15),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'نبذة عن الخدمة',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 0.5),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(5.0),
                                        child: TextField(
                                          // textAlign: TextAlign.center,
                                          controller: textDescription,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                15.0, 15.0, 5, 15),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 20.0,
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 40.0),
                                      child: Text(
                                        'الكمية',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        'السعر',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 5.0,
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                128, 128, 128, 0.5),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      width: 150.0,
                                      height: 50.0,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        // textAlign: TextAlign.center,
                                        controller: textQuantity,
                                        autofocus: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                128, 128, 128, 0.5),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      width: 150.0,
                                      height: 48.0,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        // textAlign: TextAlign.center,
                                        controller: textPrice,
                                        autofocus: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 20.0,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'طريقة التسليم',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 320,
                                      height: 48.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 0.5),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: textDeliveryMethod,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 20.0,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مدة التسليم',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 320,
                                      height: 48.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  128, 128, 128, 0.5),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: textDeliveryTime,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 20.0,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'إضافة صورة للمنتج',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 100.0,
                                            height: 100.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        72, 175, 218, 1),
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: InkWell(
                                                child: _image == null
                                                    ? Icon(
                                                        Icons.add_a_photo,
                                                        size: 30.0,
                                                      )
                                                    : Image.file(_image),
                                                onTap: () {
                                                  chooseFile(context);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  width: 281,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      getUserId().then((value) async {
                                        var serviceModel = ServiceModel(
                                            name: txtName.text,
                                            description: textDescription.text,
                                            quantity:
                                                double.parse(textQuantity.text),
                                            deliveryMethod:
                                                textDeliveryMethod.text,
                                            deliveryTime: textDeliveryTime.text,
                                            price: double.parse(textPrice.text),
                                            image: _uploadedFileURL,
                                            mainServiceType: getmainid(
                                                selectedmainValue,
                                                mainservices),
                                            subServiceType: getsubid(
                                                selectedsubValue, subservices),
                                            rate: 0,
                                            vendor_id: value);
                                        var service = await firestore
                                            .add(serviceModel.toMap());

                                        txtName.text = '';
                                        textDescription.text = '';
                                        textQuantity.text = '';
                                        textPrice.text = '';
                                        textDeliveryMethod.text = '';
                                        textDeliveryTime.text = '';

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    providerHomePage()));
                                      });
                                    },
                                    child: Text(
                                      'إضافة الخدمة',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      primary: Color.fromRGBO(72, 175, 218, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }

  String getmainid(String query, List<MainService> mainservices) {
    for (int i = 0; i < mainservices.length; i++) {
      if (query == mainservices[i].name) {
        return mainservices[i].id;
      } else {
        if (i == mainservices.length) {
          return "";
        } else {
          continue;
        }
      }
    }
  }

  String get_sub_main_id(String query, List<MainService> mainservices) {
    String id = getmainid(selectedmainValue, mainservices);

    items_2.clear();
    print("subservices.length : " + subservices.length.toString());
    for (int i = 0; i < subservices.length; i++) {
      print("(subservices[i].main_id : " + subservices[i].main_id);

      if (subservices[i].main_id == id) {
        print("id : " + id);
        items_2.add(subservices[i].name);
      }
    }
  }

  String getsubid(String query, List<SubService> subservice) {
    for (int i = 0; i < subservice.length; i++) {
      if (query == subservice[i].name) {
        return subservice[i].id;
      } else {
        if (i == subservice.length) {
          return "";
        } else {
          continue;
        }
      }
    }
  }

  Future chooseFile(context) async {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);

    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
    //print(statuses[Permission.location]);

    ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      pr.show();
      setState(() {
        _image = image;
      });
      DateTime now = DateTime.now();
      now_date = now.year.toString() +
          "\-" +
          now.month.toString() +
          "\-" +
          now.day.toString() +
          "\-" +
          now.hour.toString() +
          "\-" +
          now.minute.toString() +
          "\-" +
          now.second.toString();
      firebase_storage.Reference storageReference =
          FirebaseStorage.instance.ref().child(now_date);
      firebase_storage.UploadTask uploadTask = storageReference.putFile(_image);
      uploadTask.whenComplete(() {
        pr.hide();
        print('File Uploaded');
        storageReference.getDownloadURL().then((fileURL) {
          setState(() {
            _uploadedFileURL = fileURL;
          });
        });
      }).onError((error, stackTrace) {
        pr.hide();
      });
    });
  }
}

// void pickImage() async {
//   var image = await ImagePicker.pickImage(source: ImageSource.camera);
//   setState(() {
//     _image = image
//   });
// }
