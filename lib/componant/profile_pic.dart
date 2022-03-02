import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfilePic extends StatefulWidget {
  ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File _image;

  String _uploadedFileURL;

  String now_date;

  var firestore = FirebaseFirestore.instance.collection('service');

  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    return SizedBox(
      height: 115.0,
      width: 115.0,
      child: Stack(fit: StackFit.expand, overflow: Overflow.visible, children: [
        CircleAvatar(
          backgroundImage: _uploadedFileURL == null
              ? AssetImage('images/profile.png')
              : NetworkImage(_uploadedFileURL),
        ),
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
                onPressed: () async {
                  await chooseFile(context);
                  print('000000000000000000000000000000');
                },
                child: Icon(Icons.camera_alt_outlined),
              )),
        )
      ]),
    );
  }

  var _pickedImage;

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

    _pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    pr.show();
    setState(() {});

    if (_pickedImage != null) {
      _image = File(_pickedImage.path);
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
      await storageReference.putFile(_image).then((p0) {
        storageReference.getDownloadURL().then((fileURL) {
          _uploadedFileURL = fileURL;
          pr.hide();

          print('File Uploaded');
        });

      });
    }

  }

}

