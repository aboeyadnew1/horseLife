// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hourse_life/pages/complaints%20_page.dart';

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) => Complaints()));
            },
          ),
          backgroundColor: Color.fromRGBO(100, 192, 229, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: new Text(
            'المنتجات',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
                color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 29.0,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(72, 175, 218, 1),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: 300,
                          height: 220,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(72, 175, 218, 1),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'اسم المنتج :',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'المخزون المتبقي :',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'السعر :',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'عدد الطلبات على المنتج :',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'تقييم العملاء للمنتج :',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
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
