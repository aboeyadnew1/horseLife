import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' show BarChart;
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/models/Order.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/pages/add_services.dart';
import 'package:hourse_life/services/Store.dart';
import 'package:hourse_life/widgets/drawer.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class providerHomePage extends StatefulWidget {
  static String id = "providerHomePage";

  const providerHomePage({Key key}) : super(key: key);

  @override
  _providerHomePageState createState() => _providerHomePageState();
}

class _providerHomePageState extends State<providerHomePage> {
  var order = FirebaseFirestore.instance.collection('Orders');
  var firebase = FirebaseFirestore.instance.collection('Vendors');
  var customers = FirebaseFirestore.instance.collection('Customers');
  var services = FirebaseFirestore.instance.collection('service');

  QuerySnapshot Orders;
  QuerySnapshot Vendors;
  QuerySnapshot Customers;
  QuerySnapshot service;

  List<_ChartData> data;
  TooltipBehavior _tooltip;
  bool isLoading = false;
  double largest = 1.0, minimun = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    initial = 0;
    isLoading = true;
    Vendors = await firebase.get();
    Customers = await customers.get();
    service = await services.get();
    Orders = await order.get();
    print(uid.id);
    order
        .where('statue', isEqualTo: "2")
        .where('vendor_id', isEqualTo: uid.id)
        .get()
        .then((value) {
      setState(() {
        data = [
          _ChartData('طلبات جديدة', initial.toDouble()),
          _ChartData('طلبات الشحن', delivery.toDouble()),
          _ChartData('طلبات ملغية', not_delivered.toDouble()),
        ];
        if (value.size != 0) {
          delivery += value.size;
        }

        var nums = [
          initial.toDouble(),
          delivery.toDouble(),
          not_delivered.toDouble(),
        ];
        nums.sort();

        largest = nums.last;
        minimun = nums.first;
      });
    });
    order
        .where('statue', isEqualTo: "0")
        .where('vendor_id', isEqualTo: uid.id)
        .get()
        .then((value) {
      setState(() {
        data = [
          _ChartData('طلبات جديدة', initial.toDouble()),
          _ChartData('طلبات الشحن', delivery.toDouble()),
          _ChartData('طلبات ملغية', not_delivered.toDouble()),
        ];

        if (value.size != 0) {
          initial += value.size;
        }
        var nums = [
          initial.toDouble(),
          delivery.toDouble(),
          not_delivered.toDouble(),
        ];
        nums.sort();

        largest = nums.last;
        minimun = nums.first;
      });
    });
    order
        .where('statue', isEqualTo: "4")
        .where('vendor_id', isEqualTo: uid.id)
        .get()
        .then((value) {
      setState(() {
        data = [
          _ChartData('طلبات جديدة', initial.toDouble()),
          _ChartData('طلبات الشحن', delivery.toDouble()),
          _ChartData('طلبات ملغية', not_delivered.toDouble()),
        ];
        if (value.size != 0) {
          not_delivered += value.size;
        }

        var nums = [
          initial.toDouble(),
          delivery.toDouble(),
          not_delivered.toDouble(),
        ];
        nums.sort();

        largest = nums.last;
        minimun = nums.first;
      });
    });
    order.where('vendor_id', isEqualTo: uid.id).get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        sales += value.docs[i].get("total");
      }
      setState(() {
        data = [
          _ChartData('طلبات جديدة', initial.toDouble()),
          _ChartData('طلبات الشحن', delivery.toDouble()),
          _ChartData('طلبات ملغية', not_delivered.toDouble()),
        ];
        var nums = [
          initial.toDouble(),
          delivery.toDouble(),
          not_delivered.toDouble(),
        ];
        nums.sort();

        largest = nums.last;
        minimun = nums.first;
      });
    });

    isLoading = false;
  }

  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = min(value, 2);
    setState(() {});
  }

  int delivery = 0;
  int not_delivered = 0;
  int initial = 0;
  int vendors = 0;
  double sales = 0.0;

  List<Order> orders2 = [];
  List<Order> orders = [];

  @override
  Widget build(BuildContext context) {
    _tooltip = TooltipBehavior(enable: true);
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    Store _store = Store();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          actions: [],
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Center(
                  child: Image.asset(
                    'images/photo1.png',
                    width: 70.0,
                    height: 70.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: myDrawer(),
        body: (isLoading)
            ? Center(child: CircularProgressIndicator())
            : StreamBuilder<QuerySnapshot>(
                stream: _store.loadOrders(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    orders.clear();
                    for (var doc in snapshot.data.docs) {
                      if (uid.id == doc.get("vendor_id") &&
                          doc.get("statue") == "0") {
                        initial += 1;
                      }
                    }
                    // if (doc.get("user_id") == userpro.user.id) {
                    //
                    // }
                  }
                  return SafeArea(
                      child: SingleChildScrollView(
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(children: [
                                    InkWell(
                                      child: Text(
                                        'تسجيل خدمة جديدة',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color:
                                                Color.fromRGBO(72, 175, 218, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    newService()));
                                      },
                                    ),
                                    SizedBox(height: 20.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              40,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  2, 175, 218, 1),
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              title: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  'طلبات الشحن',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              subtitle: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  delivery.toString(),
                                                  style: TextStyle(
                                                      fontSize: 28.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          72, 175, 218, 1)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              40,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  2, 175, 218, 1),
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              title: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  'طلبات جديدة',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              subtitle: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  initial.toString(),
                                                  style: TextStyle(
                                                      fontSize: 28.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          72, 175, 218, 1)),
                                                ),
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
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              40,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  2, 175, 218, 1),
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              title: Text(
                                                ' طلبات ملغية',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: 'Cairo',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  not_delivered.toString(),
                                                  style: TextStyle(
                                                      fontSize: 28.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          72, 175, 218, 1)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              40,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  2, 175, 218, 1),
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              title: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  'المبيعات',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              //share
                                              subtitle: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  sales.toString(),
                                                  style: TextStyle(
                                                      fontSize: 24.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          72, 175, 218, 1)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'التقارير البيانية',
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                        width: 354.0,
                                        height: 220.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                Color.fromRGBO(2, 175, 218, 1),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Center(
                                            child: Container(
                                                child: SfCartesianChart(
                                                    primaryXAxis:
                                                        CategoryAxis(),
                                                    primaryYAxis: NumericAxis(
                                                        minimum: 0,
                                                        maximum: largest + 2,
                                                        interval: minimun == 0
                                                            ? 1
                                                            : minimun / 2),
                                                    tooltipBehavior: _tooltip,
                                                    series: <
                                                        ChartSeries<_ChartData,
                                                            String>>[
                                              ColumnSeries<_ChartData, String>(
                                                  dataSource: data,
                                                  xValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (_ChartData data, _) =>
                                                          data.y,
                                                  name: 'Gold',
                                                  color: Color.fromRGBO(
                                                      8, 142, 255, 1))
                                            ])))),
                                  ])))));
                }));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
// class DataSearch extends SearchDelegate<String> {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // Action for Appbar
//     // throw UnimplementedError();
//     return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // icon leading
//     // throw UnimplementedError();
//     return IconButton(onPressed: () {
//       close(context, '');
//     }, icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // result search
//     throw UnimplementedError();

//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // show when someone searchs for something
//     return Text('body Search');
//   }
// }
