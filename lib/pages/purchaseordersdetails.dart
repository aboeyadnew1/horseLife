import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hourse_life/models/Complaint.dart';
import 'package:hourse_life/models/Order.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/models/time_line_model.dart';
import 'package:hourse_life/provider/UserProvider.dart';
import 'package:hourse_life/services/Store.dart';
import 'package:hourse_life/widgets/App_Bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

class PurchaseOrdersDetails extends StatefulWidget {
  static String id = "PurchaseOrdersDetails";

  @override
  _PurchaseOrdersDetailsState createState() => _PurchaseOrdersDetailsState();
}

class _PurchaseOrdersDetailsState extends State<PurchaseOrdersDetails> {
  ScrollController controller = ScrollController();
  List<Service> services = [];

  @override
  Widget build(BuildContext context) {
    Store _store = new Store();

    UserProvider userpro = Provider.of<UserProvider>(context, listen: false);
    Order order = ModalRoute.of(context)?.settings.arguments as Order;
    TextEditingController txt_con = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: App_Bar(title: order.id)),
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadOrderDetails(order.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              services.clear();
              for (var doc in snapshot.data.docs) {
                Service service = new Service(
                  id: doc.get("id"),
                  description: doc.get("description"),
                  image: doc.get("image"),
                  name: doc.get("name"),
                  price: doc.get("price"),
                  quantity: doc.get("quantity"),
                  rate: doc.get("rate"),
                );

                services.add(service);
              }
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
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
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      services[index]
                                                          .name
                                                          .toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      services[index]
                                                          .name
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'السعر: ' +
                                                                services[index]
                                                                    .price
                                                                    .toString() +
                                                                " ريال",
                                                            style: TextStyle(
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color
                                                                    .fromRGBO(
                                                                        100,
                                                                        192,
                                                                        229,
                                                                        1)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "الكمية : " +
                                                              services[index]
                                                                  .quantity
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      100,
                                                                      192,
                                                                      229,
                                                                      1)),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            //End offirst section
                                            //Start  of Second Section of Card
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 55.0, top: 10),
                                                    width: 120.0,
                                                    height: 110,
                                                    child: Card(
                                                      semanticContainer: true,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      child: Image.network(
                                                        services[index]
                                                                        .image
                                                                        .toString() ==
                                                                    null ||
                                                                services[index]
                                                                        .image
                                                                        .toString() ==
                                                                    "" ||
                                                                services[index]
                                                                        .image
                                                                        .toString() ==
                                                                    "null"
                                                            ? "https://customercare.igloosoftware.com/.api2/api/v1/communities/10068556/previews/thumbnails/4fc20722-5368-e911-80d5-b82a72db46f2?width=680&height=680&crop=False"
                                                            : services[index]
                                                                .image
                                                                .toString(),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      elevation: 5,
                                                      margin:
                                                          EdgeInsets.all(10),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //End of Second Section of Card
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: new FloatingActionButton(
        child: const Icon(
          Icons.comment,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  //this right here
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "اضافة شكوي جديدة",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Cairo',
                                color: Colors.black),
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            controller: txt_con,
                            decoration: InputDecoration(
                              hintText: "نص الشكوي ..",
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(72, 175, 218, 1),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);

                              if (txt_con.text.trim() == "") {
                                Fluttertoast.showToast(
                                    msg: "نص الشكوي مطلوب  !".toString(),
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                _store.addComplaint(
                                    new Complaint(
                                        user_id: userpro.user.id,
                                        username: userpro.user.name,
                                        order_id: order.id,
                                        text: txt_con.text),
                                    context);
                              }

                            },
                            child: Text(
                              "ارسال",
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
      ),
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
