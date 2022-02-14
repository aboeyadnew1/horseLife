import 'dart:math';

import 'package:admin_life_horse/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final controller = FloatingSearchBarController();

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = min(value, 2);
    _index == 2 ? controller.hide() : controller.show();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        actions: [
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     showSearch(context: context, delegate: DataSearch());

          //   },
          // ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'images/photo1.png',
              width: 70.0,
              height: 70.0,
            )),
          ],
        ),
      ),
      drawer: myDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            
          ]),
        ),
      ),
    );
  }
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
