// import 'package:flutter/material.dart';
// import 'package:hourse_life/componant/profilemenu.dart';
// import 'package:hourse_life/constants/constants.dart';
// import 'package:hourse_life/pages/complaints%20_page.dart';
// import 'package:hourse_life/pages/login_screen.dart';
// import 'package:hourse_life/pages/orders_pages/purchaseorders.dart';
// import 'package:hourse_life/pages/profile/edit_profile_data_screen.dart';
//
// import 'package:provider/provider.dart';
//
// class Body extends StatelessWidget {
//   const Body({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return SafeArea(
//         child: Column(children: [
//       SizedBox(
//         height: 20.0,
//       ),
//           SizedBox(
//             height: 115.0,
//             width: 115.0,
//             child: Stack(fit: StackFit.expand, overflow: Overflow.visible, children: [
//               CircleAvatar(
//                 child:ClipOval(child: uid == null
//                     ? Image.asset('images/profile.png',fit: BoxFit.cover,width: 110,height: 110,)
//                     : (uid.image == null||uid.image == "")
//                     ? Image.asset('images/profile.png',fit: BoxFit.cover,width: 110,height: 110,)
//                     : Image.network(uid.image,fit: BoxFit.cover,width: 110,height: 110,),)
//               ),
//             ]),
//           ),
//       Text(uid == null ? "user" : uid.name),
//       GestureDetector(
//         onTap: (){
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => EditUserData()));
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.edit,
//               color: Color.fromRGBO(72, 175, 218, 1),
//             ),
//             Text(
//               'تعديل',
//               style: TextStyle(color: Color.fromRGBO(72, 175, 218, 1)),
//             )
//           ],
//         ),
//       ),
//       SizedBox(
//         height: 20.0,
//       ),
//       ProfileMenu(
//         icons: (Icons.shopping_cart_outlined),
//         text: "الطلبات ",
//         press: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => PurchaseOrders()));
//         },
//       ),
//       ProfileMenu(
//         icons: (Icons.person_pin),
//         text: " بيانات الحساب",
//         press: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => EditUserData()));
//         },
//       ),
//       ProfileMenu(
//         icons: Icons.add_alert,
//         text: "الشكاوي ",
//         press: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => Complaints()));
//         },
//       ),
//
//          ProfileMenu(
//           icons: (Icons.logout),
//           text: "تسجيل الخروج",
//           press: () {showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return Dialog(
//                   shape: RoundedRectangleBorder(
//                       borderRadius:
//                       BorderRadius.circular(20.0)), //this right here
//                   child: Container(
//                     height: 200,
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "تاكيد تسجيل الخروج !",
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.w400,
//                                 fontFamily: 'Cairo',
//                                 color: Colors.redAccent),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: Icon(
//                               Icons.logout,
//                               color: Colors.redAccent,
//                               size: 40,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               uid=null;
//                               Navigator.of(context)
//                                   .pushNamedAndRemoveUntil(LogInScreen.id, (Route<dynamic> route) => false);
//                             },
//                             child: Text(
//                               "خروج ",
//                               style: TextStyle(
//                                   fontSize: 18.0,
//                                   decoration: TextDecoration.underline,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: 'Cairo',
//                                   color: Colors.redAccent),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               "الغاء ",
//                               style: TextStyle(
//                                   fontSize: 16.0,
//                                   decoration: TextDecoration.underline,
//                                   fontWeight: FontWeight.w400,
//                                   fontFamily: 'Cairo',
//                                   color: Colors.black45),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               });
//           },
//         ),
//     ]));
//   }
// }
