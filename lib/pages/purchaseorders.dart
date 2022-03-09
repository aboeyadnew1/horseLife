import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/models/Order.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/models/time_line_model.dart';
import 'package:hourse_life/pages/purchaseordersdetails.dart';
import 'package:hourse_life/provider/UserProvider.dart';
import 'package:hourse_life/services/Store.dart';
import 'package:hourse_life/widgets/App_Bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

class PurchaseOrders extends StatefulWidget {
  static String id = "PurchaseOrders";
  @override
  _PurchaseOrdersState createState() => _PurchaseOrdersState();
}
class _PurchaseOrdersState extends State<PurchaseOrders> {
  TextEditingController search_con = TextEditingController();
  int index = 0;
  ScrollController controller = ScrollController();
  List<Order> orders2 = [];
  List<Order> orders = [];

  @override
  Widget build(BuildContext context) {
    Store _store = new Store();

    UserProvider userpro = Provider.of<UserProvider>(context, listen: false);

    String data = "";
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: App_Bar(title: ' طلبات الشراء')),
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadOrders(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              orders.clear();
              for (var doc in snapshot.data.docs) {
                Order order = new Order(
                  id: doc.get("id"),
                  user_id: doc.get("user_id"),
                  vendor_id: doc.get("vendor_id"),
                  email: doc.get("email"),
                  address: doc.get("address"),
                  state: doc.get("state"),
                  lat: doc.get("lat"),
                  lng: doc.get("lng"),
                  creation_date: doc.get("creation_date"),
                  delivered_date: doc.get("delivered_date"),
                  updated_date: doc.get("updated_date"),
                  statue: doc.get("statue"),
                  total: doc.get("total"),
                  rate: doc.get("rate"),
                );

                orders.add(order);


                }
                // if (doc.get("user_id") == userpro.user.id) {
                //
                // }

              }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              'طلبات تحت الأجراء ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: index == 0 ? Colors.white : kMainColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              setState(() {
                                index = 0;
                              });
                              orders2.clear();
                              for (int i = 0; i < orders.length; i++) {
                                if (orders[i].statue == "0" ||
                                    orders[i].statue == "1" ||
                                    orders[i].statue == "2") {
                                  orders2.add(orders[i]);
                                }
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: index == 0
                                  ? MaterialStateProperty.all(
                                      Color.fromRGBO(72, 175, 218, 1))
                                  : MaterialStateProperty.all(
                                      Color.fromRGBO(250, 250, 250, 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              'طلبات تم توصيلها ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: index == 1 ? Colors.white : kMainColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              setState(() {
                                index = 1;
                              });
                              orders2.clear();
                              for (int i = 0; i < orders.length; i++) {
                                if (orders[i].statue == "3") {
                                  orders2.add(orders[i]);
                                }
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: index == 1
                                  ? MaterialStateProperty.all(
                                      Color.fromRGBO(72, 175, 218, 1))
                                  : MaterialStateProperty.all(
                                      Color.fromRGBO(250, 250, 250, 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              'طلبات ملغية ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: index == 2 ? Colors.white : kMainColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              setState(() {
                                index = 2;
                              });
                              orders2.clear();
                              for (int i = 0; i < orders.length; i++) {
                                if (orders[i].statue == "4") {
                                  orders2.add(orders[i]);
                                }
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: index == 2
                                  ? MaterialStateProperty.all(
                                      Color.fromRGBO(72, 175, 218, 1))
                                  : MaterialStateProperty.all(
                                      Color.fromRGBO(250, 250, 250, 1)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          itemCount: orders2.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                var data = orders2[index];
                                Navigator.of(context).pushNamed(
                                    PurchaseOrdersDetails.id,
                                    arguments: data);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(72, 175, 218, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //first section
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'رقم الطلب : ' +
                                                    orders2[index]
                                                        .id
                                                        .toString(),
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'اسم العميل : ' +
                                                    orders2[index].user_id
                                                        .toString(),
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'العنوان : ' +
                                                    orders2[index].address,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'تاريخ الانشاء : ' +
                                                    orders2[index]
                                                        .creation_date,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                orders2[index].delivered_date ==
                                                        null
                                                    ? ""
                                                    : orders2[index]
                                                        .delivered_date,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                orders2[index].statue == "0"
                                                    ? "تحت الاجراء"
                                                    : orders2[index].statue ==
                                                            "1"
                                                        ? "جاري الشحن"
                                                        : orders2[index]
                                                                    .statue ==
                                                                "2"
                                                            ? "تم الشحن"
                                                            : orders2[index]
                                                                        .statue ==
                                                                    "3"
                                                                ? "تم التوصيل "
                                                                : orders2[index]
                                                                            .statue ==
                                                                        "4"
                                                                    ? "ملغي"
                                                                    : orders2[
                                                                            index]
                                                                        .statue,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //End offirst section
                                        //Start  of Second Section of Card

                                        //End of Second Section of Card
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          orders2[index].statue == "4"
                                              ? SizedBox()
                                              : Expanded(
                                                  child: ElevatedButton(
                                                    child: Text(
                                                      'تتبع طلب الشراء ',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    onPressed: () {
                                                      showMaterialModalBottomSheet(
                                                        context: context,
                                                        builder: (context) =>
                                                            SingleChildScrollView(
                                                          controller:
                                                              ModalScrollController
                                                                  .of(context),
                                                          child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2.5,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          15),
                                                              child: Column(
                                                                children: [
                                                                  Center(
                                                                    child: Text(
                                                                      'تتبع الطلب  ',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                        TimeLine(
                                                                      data: orders[
                                                                          index],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
                                                      );
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color
                                                                  .fromRGBO(
                                                                      72,
                                                                      175,
                                                                      218,
                                                                      1)),
                                                    ),
                                                  ),
                                                ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          orders[index].statue == "0"
                                              ? Expanded(
                                                  child: ElevatedButton(
                                                    child: Text(
                                                      'الغاء الطلب',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    onPressed: () {
                                                      showDialog(
                                                          barrierDismissible:
                                                              true,
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0)),
                                                              //this right here
                                                              child: Container(
                                                                height: 250,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        "تاكيد الغاء الطلب",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20.0,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(15.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .cancel,
                                                                          color:
                                                                              Colors.black45,
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                      TextField(
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            data =
                                                                                value;
                                                                          });
                                                                        },
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              "سبب الالغاء ..",
                                                                          contentPadding:
                                                                              EdgeInsets.symmetric(vertical: 12),
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color.fromRGBO(72, 175, 218, 1),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          orders2[index].statue =
                                                                              "4";
                                                                          orders2[index].delivered_date =
                                                                              data;
                                                                          _store.editOrder(
                                                                              orders2[index],
                                                                              orders2[index].id,
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "تاكيد",
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
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: 0,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class TimeLine extends StatefulWidget {
  final Order data;

  TimeLine({Key key, this.data});

  @override
  _TimeLineState createState() => _TimeLineState(data);
}

class _TimeLineState extends State<TimeLine> {
  final Order data;

  _TimeLineState(this.data);

  @override
  Widget build(BuildContext context) {
    List<TimeLineModel> data = [];
    data.add(new TimeLineModel(
        id: this.data.statue == "0" ? "1" : "0", name: "تحت الأجراء"));
    data.add(new TimeLineModel(
        id: this.data.statue == "1" ? "1" : "0", name: "جارى الشحن"));
    data.add(new TimeLineModel(
        id: this.data.statue == "2" ? "1" : "0", name: "تم الشحن"));
    data.add(new TimeLineModel(
        id: this.data.statue == "3" ? "1" : "0", name: "تم التوصيل"));
    data.add(new TimeLineModel(
        id: this.data.statue == "4" ? "1" : "0", name: "ملغي"));

    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
                child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 2,
                      height: 10,
                      color: Colors.black26,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: data[index].id == "0"
                              ? Colors.black26
                              : Colors.green,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          data[index].id == "0"
                              ? Icons.circle
                              : Icons.check_circle,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 10,
                      color: Colors.black26,
                    ),
                  ],
                ),
                Container(
                  child: Text(data[index].name),
                )
              ],
            ));
          }),
    );
  }
}
