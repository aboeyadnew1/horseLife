import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/models/Order.dart';
import 'package:hourse_life/models/time_line_model.dart';
import 'package:hourse_life/pages/orders_pages/order1.dart';
import 'package:hourse_life/pages/orders_pages/purchaseordersdetails.dart';
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
  var _firebase = FirebaseFirestore.instance.collection('Orders');

  @override
  Widget build(BuildContext context) {
    Store _store = Store();

    UserProvider userpro = Provider.of<UserProvider>(context, listen: false);

    String data = "";

    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadOrders(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            orders.clear();
            for (var doc in snapshot.data.docs) {
              Order order = Order(
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

              if (uid.id == doc.get("vendor_id")) {
                orders.add(order);
              }
            }
            // if (doc.get("user_id") == userpro.user.id) {
            //
            // }

          }
          Scaffold(
            body: DefaultTabController(
              length: 3,
              child: Scaffold(
                  body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    new SliverAppBar(
                      backgroundColor: kMainColor,
                      pinned: true,
                      floating: true,
                      bottom: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // Creates border
                            color: Colors.white12),
                        tabs: [
                          Tab(
                              child: Text(
                            'طلبات تحت الأجراء',
                            style: TextStyle(color: Colors.white),
                          )),
                          Tab(
                              child: Text('طلبات تم توصيلها',
                                  style: TextStyle(color: Colors.white))),
                          Tab(
                              child: Text(' طلبات ملغية',
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: <Widget>[
                    order1(getorderbystatue("0")),
                    order1(getorderbystatue("0")),
                    order1(getorderbystatue("0")),
                    // Customers_home(),
                    // PurchaseOrders(),
                    // UserComplaints(),
                  ],
                ),
              )),
            ),
          );
        });
  }

  List<Order> getorderbystatue(String statue) {
    List<Order> newlist = [];
    for (int i = 0; i < orders.length; i++) {
      if (orders[i].statue == statue) {
        newlist.add(orders[i]);
      }
    }
    return newlist;
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
    data.add(TimeLineModel(
        id: this.data.statue == "0" ? "1" : "0", name: "تحت الأجراء"));
    data.add(TimeLineModel(
        id: this.data.statue == "1" ? "1" : "0", name: "جارى الشحن"));
    data.add(TimeLineModel(
        id: this.data.statue == "2" ? "1" : "0", name: "تم الشحن"));
    data.add(TimeLineModel(
        id: this.data.statue == "3" ? "1" : "0", name: "تم التوصيل"));
    data.add(
        TimeLineModel(id: this.data.statue == "4" ? "1" : "0", name: "ملغي"));

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
                        child: InkWell(
                          child: Icon(
                            data[index].id == "0"
                                ? Icons.circle
                                : Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          onTap: () {
                            if (data[index].id == '1') {
                              var _firebase = FirebaseFirestore.instance
                                  .collection('Orders');
                              _firebase.doc(data[index].id).set({});
                            }
                          },
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
