import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/pages/deleted_orders.dart';
import 'package:hourse_life/pages/edit_purchas_order.dart';
import 'package:hourse_life/pages/home.dart';
import 'package:hourse_life/pages/un_completed_orders.dart';

class trackPurchaseOrders extends StatefulWidget {
  @override
  _trackPurchaseOrdersState createState() => _trackPurchaseOrdersState();
}

class _trackPurchaseOrdersState extends State<trackPurchaseOrders> {
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
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () {    Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (builder) =>
                        Home()));},
          ),
          backgroundColor: Color.fromRGBO(100, 192, 229, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: new Text(
            'تتبع طلبات الشراء',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
                color: Colors.white),
          ),
          
        ),
        body:
        Padding(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 100.0,
                          child: ElevatedButton(
                              child: Text(
                                'طلبات تحت الإجراء',
                                style: TextStyle(
                                    fontSize: 12.0, fontWeight: FontWeight.w400),
                              ),
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(72, 175, 218, 1)),
                              )),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50.0,
                              width: 100.0,
                              child: ElevatedButton(
                                  child: Text(
                                    'طلبات معلقة',
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(72, 175, 218, 1)),
                                  ),
                                  onPressed: () {   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              UncompleteOrder()));},
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50.0,
                              width: 100.0,
                              child: ElevatedButton(
                                  child: Text(
                                    'طلبات ملغية',
                                    style: TextStyle(
                                        color: Color.fromRGBO(72, 175, 218, 1),
                                        fontSize: 12.0,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                DeltetdOrders()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //first section
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'رقم الطلب',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'رقم العميل',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'الكمية',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'السعر',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'مواعيد الاستلام ',
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
                                      left: 10.0,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 55.0),
                                      width: 103.0,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(100, 192, 229, 1),
                                        borderRadius: BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color.fromRGBO(72, 175, 218, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //End of Second Section of Card
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 36.0,
                                    width: 163,
                                    child: ElevatedButton(
                                      child: Text(
                                        'تعديل حالة الطلب',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (builder) => EditPurchaseOrders()));


                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(72, 175, 218, 1)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: SizedBox(
                                      height: 36.0,
                                      width: 163,
                                      child: ElevatedButton(
                                        child: Text(
                                          'اجراء شكوى',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {
                                          
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      72, 175, 218, 1)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //first section
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'رقم الطلب',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'رقم العميل',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'الكمية',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'السعر',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'مواعيد الاستلام ',
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
                                      left: 10.0,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 55.0),
                                      width: 103.0,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(100, 192, 229, 1),
                                        borderRadius: BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color.fromRGBO(72, 175, 218, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //End of Second Section of Card
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 36.0,
                                    width: 163,
                                    child: ElevatedButton(
                                      child: Text(
                                        'تعديل حالة الطلب',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(72, 175, 218, 1)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: SizedBox(
                                      height: 36.0,
                                      width: 163,
                                      child: ElevatedButton(
                                        child: Text(
                                          'اجراء شكوى',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      72, 175, 218, 1)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: 20.0,),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //first section
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'رقم الطلب',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'رقم العميل',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'الكمية',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'السعر',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'مواعيد الاستلام ',
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
                                      left: 10.0,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 55.0),
                                      width: 103.0,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(100, 192, 229, 1),
                                        borderRadius: BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color.fromRGBO(72, 175, 218, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //End of Second Section of Card
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 36.0,
                                    width: 163,
                                    child: ElevatedButton(
                                      child: Text(
                                        'تعديل حالة الطلب',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(72, 175, 218, 1)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: SizedBox(
                                      height: 36.0,
                                      width: 163,
                                      child: ElevatedButton(
                                        child: Text(
                                          'اجراء شكوى',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      72, 175, 218, 1)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
