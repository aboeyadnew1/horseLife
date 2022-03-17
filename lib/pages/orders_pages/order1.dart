import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/constant/constants.dart';
import 'package:hourse_life/models/Order.dart';
import 'package:hourse_life/pages/orders_pages/purchaseordersdetails.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/App_Bar.dart';

class order1 extends StatefulWidget {
  List<Order> getorderbystatue;
  String statue;

  order1(this.getorderbystatue, this.statue, {Key key}) : super(key: key);

  @override
  _order1State createState() =>
      _order1State(this.getorderbystatue, this.statue);
}

class _order1State extends State<order1> {
  List<Order> getorderbystatue;
  ScrollController controller = ScrollController();
  String statue;

  _order1State(this.getorderbystatue, this.statue);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: getorderbystatue.length,
            itemBuilder: (context, i) {
              return Column(
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
                        itemCount: getorderbystatue.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              var data = getorderbystatue[index];
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
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'رقم الطلب : ' +
                                                  getorderbystatue[index]
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
                                                  getorderbystatue[index]
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
                                                  getorderbystatue[index]
                                                      .address,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'تاريخ الانشاء : ' +
                                                  getorderbystatue[index]
                                                      .creation_date,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              getorderbystatue[index]
                                                          .delivered_date ==
                                                      null
                                                  ? ""
                                                  : getorderbystatue[index]
                                                      .delivered_date,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              getorderbystatue[index].statue ==
                                                      "0"
                                                  ? "تحت الاجراء"
                                                  : getorderbystatue[index]
                                                              .statue ==
                                                          "1"
                                                      ? "جاري الشحن"
                                                      : getorderbystatue[index]
                                                                  .statue ==
                                                              "2"
                                                          ? "تم الشحن"
                                                          : getorderbystatue[
                                                                          index]
                                                                      .statue ==
                                                                  "3"
                                                              ? "تم التوصيل "
                                                              : getorderbystatue[
                                                                              index]
                                                                          .statue ==
                                                                      "4"
                                                                  ? "ملغي"
                                                                  : getorderbystatue[
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
                                        getorderbystatue[index].statue == "4"
                                            ? SizedBox()
                                            : Expanded(
                                                child: ElevatedButton(
                                                  child: Text(
                                                    'تتبع الطلب ',
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
                                                                    data: getorderbystatue[
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
                                                            .all(Color.fromRGBO(
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
              );
            }),
      ),
    );
  }
}
