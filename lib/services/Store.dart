import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hourse_life/models/Complaint.dart';
import 'package:hourse_life/models/Order.dart';
import 'package:hourse_life/pages/order_statue.dart';
import 'package:hourse_life/provider/UserProvider.dart';
import 'package:hourse_life/provider/cartItem.dart';
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
  addOrder(Order order, BuildContext context) async {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    await pr.show();
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);

    DateTime now = DateTime.now();
    String now_date = now.year.toString() +
        now.month.toString() +
        now.day.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString() +
        now.millisecond.toString() +
        now.microsecond.toString();

    _firestore.collection("Orders").doc(now_date).set({
      'id': now_date,
      'user_id': order.user_id,
      'vendor_id': order.vendor_id,
      'email': order.email,
      'address': order.address,
      'state': order.state,
      'lat': order.lat,
      'lng': order.lng,
      'creation_date': order.creation_date,
      'delivered_date': "",
      'updated_date': "",
      'statue': order.statue,
      'total': order.total,
      'rate': order.rate,
    }).then((value) {
      for (int i = 0; i < order.services.length; i++) {
        _firestore
            .collection("Orders")
            .doc(now_date)
            .collection("OrderDetails")
            .doc("" + order.services[i].id)
            .set({
          'id': order.services[i].id,
          'mainServiceType': order.services[i].mainServiceType,
          'subServiceType': order.services[i].subServiceType,
          'name': order.services[i].name,
          'description': order.services[i].description,
          'quantity': order.services[i].quantity,
          'price': order.services[i].price,
          'image': order.services[i].image,
          'rate': order.services[i].rate,
        }).then((value) async {
          if (i == order.services.length - 1) {
            await pr.hide();
            cartItem.products.clear();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20.0)), //this right here
                    child: Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "تم تأكيد العملية بنجاح ",
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => order_statue(),
                                  ),
                                );
                              },
                              child: Text(
                                "تتبع الطلب ",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    decoration: TextDecoration.underline,
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
          }
        });
      }
    }).onError((error, stackTrace) async {
      await pr.hide();
      showDialog(
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
                        "فشل اضافة الطلب تاكد من اتصالك بالانترنت !",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Cairo',
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }

  editOrder(Order order, documentId, context) async {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    await pr.show();

    _firestore.collection("Orders").doc(documentId).update({
      'delivered_date': order.delivered_date,
      'updated_date': order.updated_date,
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
    }).onError((error, stackTrace) async {
      await pr.hide();
    });
  }

  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection("Orders").snapshots();
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
        .collection("Customers")
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
