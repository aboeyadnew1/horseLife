import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/pages/home_page/home.dart';
import 'package:hourse_life/widgets/drawer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class providerHomePage extends StatefulWidget {
  @override
  _providerHomePageState createState() => _providerHomePageState();
}

class _providerHomePageState extends State<providerHomePage> {
  var firebase = FirebaseFirestore.instance.collection('service');
  QuerySnapshot service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    service = await firebase.where('user_id', isNotEqualTo: null).get();
    setState(() {});
  }

  double ratingValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.notifications)],
        toolbarHeight: 80.0,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'images/photo1.png',
            //   width: 80.0,
            //   height: 80.0,
            // )
          ],
        ),
      ),
      drawer: myDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  InkWell(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'تسجيل خدمة جديدة',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromRGBO(72, 175, 218, 1),
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Home()));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: 166.0,
                      height: 86.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(72, 175, 218, 1)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.local_shipping_rounded,
                              size: 45.0,
                              color: Color.fromRGBO(72, 175, 218, 1),
                            ),
                            Text(
                              ' طلبات الشحن',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 166.0,
                    height: 86.0,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(72, 175, 218, 1)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            size: 35.0,
                            color: Color.fromRGBO(72, 175, 218, 1),
                          ),
                          Text(
                            ' الطلبات الجديدة',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: 166.0,
                      height: 86.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(72, 175, 218, 1)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 45.0,
                              color: Color.fromRGBO(72, 175, 218, 1),
                            ),
                            Text(
                              ' الطلبات المعلقة',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 166.0,
                    height: 86.0,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(72, 175, 218, 1)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_graph_outlined,
                            size: 45.0,
                            color: Color.fromRGBO(72, 175, 218, 1),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'الأرباح',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                children: [
                  Text(
                    'التقارير البيانية',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                  ),
                  Container(
                    width: 329.0,
                    height: 424.0,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(72, 175, 218, 1)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 83.0,
                                  height: 98.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(72, 175, 218, 1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Text('عنوان الخدمة'),
                                SmoothStarRating(
                                  size: 20.0,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0,
                                  onRated: (rating) {
                                    ratingValue = rating;
                                    print('rating value is $ratingValue');
                                  },
                                  starCount: 5,
                                  allowHalfRating: true,
                                ),
                                Text('55 ريال '),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 83.0,
                                  height: 98.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(72, 175, 218, 1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Text('عنوان الخدمة'),
                                SmoothStarRating(
                                  size: 20.0,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0,
                                  onRated: (rating) {
                                    ratingValue = rating;
                                    print('rating value is $ratingValue');
                                  },
                                  starCount: 5,
                                  allowHalfRating: true,
                                ),
                                Text('100 ريال '),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 83.0,
                                  height: 98.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(72, 175, 218, 1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Text('عنوان الخدمة'),
                                SmoothStarRating(
                                  size: 20.0,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0,
                                  onRated: (rating) {
                                    ratingValue = rating;
                                    print('rating value is $ratingValue');
                                  },
                                  starCount: 5,
                                  allowHalfRating: true,
                                ),
                                Text('55 ريال '),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 83.0,
                                      height: 98.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                72, 175, 218, 1)),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    Text('عنوان الخدمة'),
                                    SmoothStarRating(
                                      size: 20.0,
                                      color: Colors.amber,
                                      borderColor: Colors.amber,
                                      spacing: 0,
                                      onRated: (rating) {
                                        ratingValue = rating;
                                        print('rating value is $ratingValue');
                                      },
                                      starCount: 5,
                                      allowHalfRating: true,
                                    ),
                                    Text('55 ريال '),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                children: [
                  Text(
                    'التقارير البيانية',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                  ),
                  Container(
                    width: 329.0,
                    height: 424.0,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(72, 175, 218, 1)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 83.0,
                                  height: 98.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(72, 175, 218, 1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Text('عنوان الخدمة'),
                                SmoothStarRating(
                                  size: 20.0,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0,
                                  onRated: (rating) {
                                    ratingValue = rating;
                                    print('rating value is $ratingValue');
                                  },
                                  starCount: 5,
                                  allowHalfRating: true,
                                ),
                                Text('55 ريال '),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 83.0,
                                  height: 98.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(72, 175, 218, 1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Text('عنوان الخدمة'),
                                SmoothStarRating(
                                  size: 20.0,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0,
                                  onRated: (rating) {
                                    ratingValue = rating;
                                    print('rating value is $ratingValue');
                                  },
                                  starCount: 5,
                                  allowHalfRating: true,
                                ),
                                Text('100 ريال '),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 83.0,
                                  height: 98.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(72, 175, 218, 1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Text('عنوان الخدمة'),
                                SmoothStarRating(
                                  size: 20.0,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0,
                                  onRated: (rating) {
                                    ratingValue = rating;
                                    print('rating value is $ratingValue');
                                  },
                                  starCount: 5,
                                  allowHalfRating: true,
                                ),
                                Text('55 ريال '),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 83.0,
                                      height: 98.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                72, 175, 218, 1)),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    Text('عنوان الخدمة'),
                                    SmoothStarRating(
                                      size: 20.0,
                                      color: Colors.amber,
                                      borderColor: Colors.amber,
                                      spacing: 0,
                                      onRated: (rating) {
                                        ratingValue = rating;
                                        print('rating value is $ratingValue');
                                      },
                                      starCount: 5,
                                      allowHalfRating: true,
                                    ),
                                    Text('55 ريال '),
                                  ],
                                ),
                              ],
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
    );
  }
}
