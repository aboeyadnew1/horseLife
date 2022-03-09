import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hourse_life/pages/home.dart';
import 'package:hourse_life/provider/UserProvider.dart';
import 'package:hourse_life/services/static_data.dart';
import 'package:provider/provider.dart';
import 'data/global_data.dart';
import 'models/user.dart';
import 'pages/intro.dart';
import 'pages/login_screen.dart';
import 'pages/registration_done.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
            theme: ThemeData(
              fontFamily: 'Cairo',
              primaryColor: Color.fromRGBO(72, 175, 218, 1),
              primarySwatch: Colors.lightBlue,
            ),
            themeMode: ThemeMode.light,
            initialRoute: LogInScreen.id,
            debugShowCheckedModeBanner: false,
            routes: {

              LogInScreen.id: (context) => LogInScreen(),

            }));
    return MaterialApp(
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
      debugShowCheckedModeBanner: false,
      title: "حياة الخيل",
      home: Intro(), //providerNewAccount(),
    );
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
    selectPage();
  }

  @override
  Widget build(BuildContext context) {
    return Intro();
  }

  Future<void> selectPage() async {
    //Get intro state
    bool result = await getIntro();
    if (result == null) {
      page = Intro();
    } else {
      //get user id from shared preference
      var userId = await getUserId();

      if (userId != null) {
        bool approved = await getUser(userId);
        setState(() {
          page = approved ? Home() : RegistrationComplete();
        });
      } else {
        page = LogInScreen();
      }
    }
  }

  Future<bool> getUser(userId) async {
    var firestore = await FirebaseFirestore.instance.collection('users');
    var doc = await firestore.doc(userId).get();
    var user = User.fromMap(doc.data());
    GlobalData.user = user;
    GlobalData.userId = userId;
    return user.approved;
  }
}
