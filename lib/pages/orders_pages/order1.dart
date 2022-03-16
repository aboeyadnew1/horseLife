import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/models/Order.dart';

import '../../widgets/App_Bar.dart';
class order1 extends StatefulWidget {
  const order1(List<Order> getorderbystatue, {Key key}) : super(key: key);

  @override
  _order1State createState() => _order1State();
}

class _order1State extends State<order1> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                                                    orders2[index]
                                                        .user_id
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
                                                                  InkWell(
                                                                    child:
                                                                    TimeLine(
                                                                      data: orders[
                                                                      index],
                                                                    ),
                                                                    onTap:
                                                                        () {},
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
                                          SizedBox(
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
  }
}
