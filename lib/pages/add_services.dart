import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:hourse_life/data/mock_data.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/pages/service_provider_dashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'provider_home_page.dart';

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

  String dropdownMainServiceType;
  String dropdownSubServiceType;
  var txtName = TextEditingController();
  var textDescription = TextEditingController();
  var textQuantity = TextEditingController();
  var textPrice = TextEditingController();
  var textDeliveryMethod = TextEditingController();
  var textDeliveryTime = TextEditingController();

  var firestore = FirebaseFirestore.instance.collection('service');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/photo1.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'تسجيل خدمة جديدة',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(72, 175, 218, 1),
                            ),
                          ),
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Color.fromRGBO(72, 175, 218, 1),
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
                    Text(
                      'نوع الخدمة الرئيسية',
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
                                color: Color.fromRGBO(72, 175, 218, 1),
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10.0),
                        child: DropDown(
                          showUnderline: false,
                          dropDownType: DropDownType.Button,
                          items: const ["طبية", "مبيعات", "رعاية"],
                          hint: const Text("اختر نوع الخدمة الرئيسية"),
                          icon: const Icon(
                            Icons.expand_more,
                            color: Color.fromRGBO(155, 155, 155, 1),
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
                      'نوع الخدمة الفرعية',
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
                                color: Color.fromRGBO(72, 175, 218, 1),
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10.0),
                        child: DropDown(
                          initialValue: 'استضافة',
                          onChanged: (p) {
                            print(p?.gender);
                            setState(() {
                              dropdownSubServiceType = p;
                            });
                          },
                          showUnderline: false,
                          dropDownType: DropDownType.Button,
                          items: const ["صيدلية", "غذاء", "استضافة"],
                          hint: const Text("اختر نوع الخدمة الفرعية"),
                          icon: const Icon(
                            Icons.expand_more,
                            color: Color.fromRGBO(155, 155, 155, 1),
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
                              color: Color.fromRGBO(72, 175, 218, 1), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
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
                              color: Color.fromRGBO(72, 175, 218, 1), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(72, 175, 218, 1), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 168.0,
                      height: 48.0,
                      child: TextField(
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
                            color: Color.fromRGBO(72, 175, 218, 1), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 168.0,
                      height: 48.0,
                      child: TextField(
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
                              color: Color.fromRGBO(72, 175, 218, 1), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
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
                              color: Color.fromRGBO(72, 175, 218, 1), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: const EdgeInsets.only(left: 175.0),
                            child: SizedBox(
                              width: 150.0,
                              height: 122.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(72, 175, 218, 1),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10.0),
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
                        mainServiceType: dropdownMainServiceType,
                        subServiceType: dropdownSubServiceType,
                        name: txtName.text,
                        description: textDescription.text,
                        quantity: textQuantity.text,
                        deliveryMethod: textDeliveryMethod.text,
                        deliveryTime: textDeliveryTime.text,
                      );
                      var service = await firestore.add(serviceModel.toMap());

                      txtName.text = '';
                      textDescription.text = '';
                      textQuantity.text = '';
                      textPrice.text = '';
                      textDeliveryMethod.text = '';
                      textDeliveryTime.text = '';

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => providerHomePage()));
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      primary: Color.fromRGBO(72, 175, 218, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
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
  }

  // void pickImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = image
  //   });
  // }
}
