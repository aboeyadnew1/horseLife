// import 'package:flutter/material.dart';
// import 'package:hourse_life/pages/profile/profile_body.dart';
// import 'package:provider/provider.dart';
//
// class ProfileScreen extends StatefulWidget {
//   static String id="ProfileScreen";
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   int _selectedIndex = 0; //New
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       appBar:  PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: AppBar(
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           toolbarHeight: 80,
//           backgroundColor: Color.fromRGBO(100, 192, 229, 1),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(30),
//             ),
//           ),
//           title: new Text(
//             'بيانات الحساب',
//             style: TextStyle(
//
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: 'Cairo',
//                 color: Colors.white),
//           ),
//           actions: [
//             Image.asset(
//               "images/horse.png",
//               width: 60,
//               height: 60,
//             )
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(child: SafeArea(child: Body())),
//     );
//   }
// }
