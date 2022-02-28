import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:hourse_life/models/MainService.dart';
import 'package:hourse_life/models/SubService.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/services/Store.dart';
import 'package:image_picker/image_picker.dart';
import 'provider_home_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dropdown_search/dropdown_search.dart';

class newService extends StatefulWidget {
  @override
  _newServiceState createState() => _newServiceState();
}

class _newServiceState extends State<newService> {
  XFile image;
  File pickedImage;

  selectImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = File(image.path);
    });
  }

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
                                          Icon(
                                            Icons.arrow_back_ios_new,
                                            color:
                                                Color.fromRGBO(72, 175, 218, 1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                                  height: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'عنوان الخدمة',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 354,
                                      height: 48.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  72, 175, 218, 1),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: txtName,
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
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'نبذة عن الخدمة',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 354,
                                      height: 80.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  72, 175, 218, 1),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: textDescription,
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
                                SizedBox(
                                  height: 20.0,
                                ),
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
                                            fontSize: 20.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        'السعر',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(72, 175, 218, 1),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: 168.0,
                                      height: 48.0,
                                      child: TextField(
                                        textAlign: TextAlign.center,
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
                                            color:
                                                Color.fromRGBO(72, 175, 218, 1),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: 168.0,
                                      height: 48.0,
                                      child: TextField(
                                        textAlign: TextAlign.center,
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
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'طريقة التسليم',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 354,
                                      height: 48.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  72, 175, 218, 1),
                                              width: 2),
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
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مدة التسليم',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 354,
                                      height: 48.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  72, 175, 218, 1),
                                              width: 2),
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
                                SizedBox(
                                  height: 20.0,
                                ),
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
                                                fontSize: 20.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 175.0),
                                            child: SizedBox(
                                              width: 150.0,
                                              height: 122.0,
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
                                                  child: pickedImage == null
                                                      ? Icon(
                                                          Icons.add_a_photo,
                                                          size: 50.0,
                                                        )
                                                      : Image.file(pickedImage),
                                                  onTap: () {
                                                    selectImage();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text('رفع الصورة'))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 35.0,
                                ),
                                SizedBox(
                                  width: 281,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      var serviceModel = Service(
                                        name: txtName.text,
                                        description: textDescription.text,
                                        quantity: textQuantity.text,
                                        deliveryMethod: textDeliveryMethod.text,
                                        deliveryTime: textDeliveryTime.text,
                                      );
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
}






// void pickImage() async {
//   var image = await ImagePicker.pickImage(source: ImageSource.camera);
//   setState(() {
//     _image = image
//   });
// }

