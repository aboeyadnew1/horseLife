import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hourse_life/models/Complaint.dart';
import 'package:hourse_life/models/Order.dart';
import 'package:hourse_life/pages/orders_pages/order_statue.dart';
import 'package:hourse_life/provider/UserProvider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> loadMainServices() {
    return _firestore.collection("MainService").snapshots();
  }

  //show Sub Service In dropDown
  Stream<QuerySnapshot> loadSubService() {
    return _firestore.collection("SubService").snapshots();
  }

  //---------------------------------------------------------orders-----------------------------

  editOrder(Order order, documentId, context) async {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    await pr.show();
    DateTime now = DateTime.now();
    String date2 = now.year.toString() +"-"+
        now.month.toString() +"-"+
        now.day.toString();
    _firestore.collection("Orders").doc(documentId).update({
      'delivered_date': order.delivered_date,
      'updated_date': date2,
      'statue': order.statue,
      'rate': order.rate,
    }).then((value) async {
      Fluttertoast.showToast(
          msg: 'تم تعديل الطلب بنجاح '.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      await pr.hide();
      Navigator.of(
          context)
          .pop();
    }).onError((error, stackTrace) async {
      await pr.hide();
      Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection("Orders").snapshots();
  }
  Stream<QuerySnapshot> loadServices() {
    return _firestore.collection("service").snapshots();
  }

  Stream<QuerySnapshot> loadOrderDetails(String id) {
    return _firestore
        .collection("Orders")
        .doc(id)
        .collection("OrderDetails")
        .snapshots();
  }

  Future<QuerySnapshot> loadcustomercreatedOrders(
      String customerid,
      ) {
    return _firestore
        .collection("Orders")
        .where("user_id", isEqualTo: customerid)
        .get();
  }

  editSubService(data, documentId) {
    _firestore.collection("Orders").doc(documentId).update(data);
  }

  deletOrders(documentId) {
    _firestore.collection("Orders").doc(documentId).delete().then((value) {
      Fluttertoast.showToast(
          msg: 'orderdeleted'.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

//-------------------------------------------------------------Users------------------------------
  editprofile(data, documentId, context) async {
    UserProvider userpro = Provider.of<UserProvider>(context, listen: false);
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    await pr.show();

    _firestore
        .collection("Vendors")
        .doc(documentId)
        .update(data)
        .whenComplete(() async {
      await pr.hide();
      userpro.user = data;
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "تم تعديل بيانات الحساب بنجاح",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Cairo',
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }).onError((error, stackTrace) async {
      await pr.hide();
    });
  }

  //---------------------------------------------------------Complaints ----------------------------------------------------
  addComplaint(Complaint complaint, BuildContext context) async {

    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    await pr.show();

    DateTime now = DateTime.now();
    String now_date = now.year.toString() +
        now.month.toString() +
        now.day.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString() +
        now.millisecond.toString() +
        now.microsecond.toString();

    String date2 = now.year.toString() +"-"+
        now.month.toString() +"-"+
        now.day.toString();

    _firestore.collection("Complaints").doc(now_date).set({
      'id': now_date,
      'user_id': complaint.user_id,
      'order_id': complaint.order_id,
      'username': complaint.username,
      'text': complaint.text,
      'reply': "",
      'date':date2,

    }).then((value) async {
      await pr.hide();
      Fluttertoast.showToast(
          msg: "تم ارسال الشكوي".toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }).onError((error, stackTrace) async {
      await pr.hide();


    });
  }

  Stream<QuerySnapshot> loadComplaints() {
    return _firestore.collection("Complaints").snapshots();
  }












}
