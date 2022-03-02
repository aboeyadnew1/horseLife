import 'package:flutter/material.dart';
import 'package:hourse_life/pages/home.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (builder) => Home()));
          },
        ),
        backgroundColor: Color.fromRGBO(100, 192, 229, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: new Text(
          'لوحة التحكم',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo',
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ListView(
            children: [

              Column(
                children: [

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
