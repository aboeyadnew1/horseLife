import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/services/Store.dart';
import 'package:hourse_life/widgets/App_Bar.dart';

class Services extends StatefulWidget {
  static String id = "Services";

  const Services({Key key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool initial = false;

  final _store = new Store();

  List<ServiceModel> service_list = [];
  List<ServiceModel> service_list2 = [];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: App_Bar(
            title: 'الخدمات المقدمة',
          )),
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadServices(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              service_list.clear();

              for (var doc in snapshot.data.docs) {
                if (doc.get("vendor_id") == uid.id) {
                  service_list.add(ServiceModel(
                      id: doc.reference.id,
                      name: doc.get("name"),
                      price: doc.get("price"),
                      quantity: doc.get("quantity"),
                      deliveryTime: doc.get("deliveryTime"),
                      description: doc.get("description"),
                      image: doc.get("image"),
                      vendor_id: doc.get("vendor_id"),
                      mainServiceType: doc.get("mainServiceType"),
                      subServiceType: doc.get("subServiceType"),
                      rate: double.parse(doc.get("rate").toString()),
                      deliveryMethod: doc.get("deliveryMethod")));
                }
              }
              if (i == 0) {
                service_list2 = service_list;
              }
              i++;
            }
            return ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        service_list2 = [];
                      });

                      for (int i = 0; i < service_list.length; i++) {
                        if (service_list[i].name.contains(value.toString())) {
                          service_list2.add(service_list[i]);
                          print(service_list2.length);
                          setState(() {});
                        }
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "بحث ",
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(72, 175, 218, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  controller: controller,
                  itemCount: service_list2.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {


                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Stack(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: 5, left: 5, top: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.white.withAlpha(220),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        " " +
                                                            service_list2[index]
                                                                .name
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 80.0,
                                                          width: 80.0,
                                                          padding:
                                                              EdgeInsets.all(7),
                                                          child: Image.network(
                                                              service_list2[index]
                                                                          .image ==
                                                                      ""
                                                                  ? "https://pngimage.net/wp-content/uploads/2018/05/blue-human-icon-png-7.png"
                                                                  : service_list2[
                                                                          index]
                                                                      .image),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            72,
                                                                            175,
                                                                            218,
                                                                            1),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ExpansionTile(
                                                  initiallyExpanded: initial,
                                                  iconColor: Colors.white,
                                                  collapsedIconColor: Colors.white

                                                ,
                                                  onExpansionChanged: (bool) {
                                                    setState(() {
                                                      initial = bool;
                                                    });
                                                  },
                                                  title: Text(
                                                        service_list2[index]
                                                            .description
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black87),
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          ' السعر :' +
                                                              service_list2[
                                                                      index]
                                                                  .price
                                                                  .toString()),
                                                      Text(' الكمية :' +
                                                          service_list2[index]
                                                              .quantity
                                                              .toString())
                                                    ],
                                                  ),
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,

                                              )]),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }),
    );
  }
}
