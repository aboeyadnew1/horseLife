import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' show BarChart;
import 'package:hourse_life/pages/add_services.dart';
import 'package:hourse_life/widgets/drawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    isLoading = true;
    Vendors = await firebase.get();
    Customers = await customers.get();
    service = await services.get();
    Orders = await order.get();

    isLoading = false;
    setState(() {});
  }

  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = min(value, 2);
    setState(() {});
  }

  int delivery = 0;
  int clients = 0;
  int vendors = 0;
  double sales = 0.0;

  @override
  Widget build(BuildContext context) {
    order.where('statue', isEqualTo: 2).get().then((value) {
      setState(() {
        delivery += 1;
      });
    });
    order.where('statue', isEqualTo: 2).get().then((value) {
      setState(() {
        delivery+=1;
      });
    });
    order.where('statue', isEqualTo: 2).get().then((value) {
      setState(() {
        delivery+=1;
      });
    });
    order.where('statue', isEqualTo: 2).get().then((value) {
      setState(() {
        delivery+=1;
      });
    });
    data = [
      _ChartData('مبيعات النظام', sales),
      _ChartData('مقدمين الخدمات', vendors + 0.0),
      _ChartData('العملاء', clients + 0.0),
      _ChartData('الخدمات', delivery+0.0),
    ];
    _tooltip = TooltipBehavior(enable: true);
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    return (isLoading)
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
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
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Center(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(children: [
                              InkWell(
                                child: Text(
                                  'تسجيل خدمة جديدة',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color.fromRGBO(72, 175, 218, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => newService()));
                                },
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(2, 175, 218, 1),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            'طلبات الشحن',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                      delivery.toString()
                                                ,
                                            style: TextStyle(
                                                fontSize: 28.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    72, 175, 218, 1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(2, 175, 218, 1),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            'طلبات جديدة',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            Customers.size.toString(),
                                            style: TextStyle(
                                                fontSize: 28.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold,
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
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(2, 175, 218, 1),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        title: Text(
                                          ' طلبات معلقة',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            Vendors.size.toString(),
                                            style: TextStyle(
                                                fontSize: 28.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    72, 175, 218, 1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(2, 175, 218, 1),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            'المبيعات',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        //share
                                        subtitle: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold,
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
                                  height: 168.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(2, 175, 218, 1),
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Center(
                                      child: Container(
                                          child: SfCartesianChart(
                                              primaryXAxis: CategoryAxis(),
                                              primaryYAxis: NumericAxis(
                                                  minimum: 0,
                                                  maximum: 40,
                                                  interval: 10),
                                              tooltipBehavior: _tooltip,
                                              series: <
                                                  ChartSeries<_ChartData,
                                                      String>>[
                                        ColumnSeries<_ChartData, String>(
                                            dataSource: data,
                                            xValueMapper:
                                                (_ChartData data, _) => data.x,
                                            yValueMapper:
                                                (_ChartData data, _) => data.y,
                                            name: 'Gold',
                                            color:
                                                Color.fromRGBO(8, 142, 255, 1))
                                      ])))),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'مؤشر الشراء',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(
                                width: 354.0,
                                height: 168.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(2, 175, 218, 1),
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          child: CircularPercentIndicator(
                                        radius: 100.0,
                                        lineWidth: 15.0,
                                        percent: .5,
                                        center: new Text(
                                          "30%",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        progressColor: Colors.blue,
                                      )),
                                    ),
                                    Expanded(
                                      child: Center(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "الشراء",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "15",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "عملاء لم يقمو بالشراء",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                color: Colors.black26,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "2",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                    )
                                  ],
                                ),
                              )
                            ]))))));
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
