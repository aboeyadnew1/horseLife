import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/pages/Services.dart';
import 'package:hourse_life/pages/home_page/home.dart';
import 'package:hourse_life/pages/home_page/provider_home_page.dart';
import 'package:hourse_life/provider/UserProvider.dart';
import 'package:hourse_life/services/static_data.dart';
import 'package:hourse_life/share/cache_helper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'pages/intro.dart';
import 'pages/login_screen.dart';
import 'pages/registration_done.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  CacheHelper.getModelData(key: kUid).then((value){
    uid=value;
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
              Locale('en', '') // English, no country code
            ],
            locale: Locale("ar", "AE"),
            title: "حياة الخيل",
            theme: ThemeData(
              fontFamily: 'Cairo',
              primaryColor: Color.fromRGBO(72, 175, 218, 1),
              primarySwatch: Colors.lightBlue,
            ),
            themeMode: ThemeMode.light,
            initialRoute: uid != null ? providerHomePage.id : LogInScreen.id,
            routes: {
              LogInScreen.id: (context) => LogInScreen(),
              providerHomePage.id: (context) => providerHomePage(),
              Services.id: (context) => Services(),
            }));
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  Widget page = Container(
    color: Colors.white,
    child: Image.asset('images/horse.png'),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Intro();
  }



}
