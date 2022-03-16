import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/models/user.dart';
import 'package:hourse_life/pages/login_screen.dart';
import 'package:hourse_life/services/Store.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditUserData extends StatefulWidget {
  const EditUserData({Key key}) : super(key: key);

  @override
  _EditUserDataState createState() => _EditUserDataState();
}

class _EditUserDataState extends State<EditUserData> {
  File _image;
  String _uploadedFileURL;
  final _store = new Store();
  TextEditingController name_con = TextEditingController();
  TextEditingController address_con = TextEditingController();
  TextEditingController phone_con = TextEditingController();
  TextEditingController email_con = TextEditingController();
  TextEditingController pass_con = TextEditingController();

  @override
  Widget build(BuildContext context) {


    if (uid != null) {
      name_con.text = uid.name;
      address_con.text = uid.address;
      phone_con.text = uid.phone;
      email_con.text = uid.email;
      pass_con.text = uid.password;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(100, 192, 229, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: new Text(
          'بيانات الحساب',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo',
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 115.0,
              width: 115.0,
              child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: [
                    CircleAvatar(
                        child: ClipOval(
                      child: _image != null
                          ? Image.file(
                              _image,
                              fit: BoxFit.cover,
                        width: 110,height: 110,
                            )
                          : uid == null
                              ? Image.asset('images/profile.png',
                          width: 110,height: 110,
                                  fit: BoxFit.cover)
                              : (uid.image == null ||
                          uid.image == "")
                                  ? Image.asset('images/profile.png',
                          width: 110,height: 110,
                                      fit: BoxFit.cover)
                                  : _image == null
                                      ? Image.network(uid.image,
                          width: 110,height: 110,
                                          fit: BoxFit.cover)
                                      : Image.file(_image,
                          width: 110,height: 110,
                                          fit: BoxFit.cover),
                    )),
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
                            onPressed: () {
                              chooseFile(context);
                            },
                            child: Icon(Icons.camera_alt_outlined),
                          )),
                    )
                  ]),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                child: TextField(
                  controller: name_con,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    uid.name = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'اسم المستخدم ',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                child: TextField(
                  controller: phone_con,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    uid.phone = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_android),
                    hintText: 'رقم الجوال',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                child: TextField(
                  controller: pass_con,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    uid.password = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'كلمة المرور ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                child: TextField(
                  controller: email_con,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    uid.email = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'البريد الالكتروني ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                child: TextField(
                  controller: address_con,
                  onChanged: (value) {
                    uid.address = value;
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    hintText: 'العنوان',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: ElevatedButton(
                onPressed: () {
                  if (uid == null) {
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0)), //this right here
                            child: Container(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "رجاء تسجيل الدخول لحفظ بيانات الحساب !",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Cairo',
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(
                                        Icons.login,
                                        color: Colors.green,
                                        size: 50,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                LogInScreen.id,
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        "تسجيل الدخول ",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Cairo',
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    uid.image = _uploadedFileURL;
                    _store.editprofile(
                        new User(
                                id: uid.id,
                                name: name_con.text,
                                image: _uploadedFileURL,
                                phone: phone_con.text,
                                email: email_con.text,
                                password: pass_con.text,
                                address: address_con.text,
                                lat: uid.lat,
                                long: uid.long)
                            .toMap(),
                        uid.id,
                        context);
                  }
                },
                child: Text(
                  'حفظ البيانات',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: Size(0, 45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String now_date;

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
