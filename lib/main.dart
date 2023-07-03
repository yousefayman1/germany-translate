import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:german/layout/home_screen.dart';
import 'package:german/home/simples_EXM.dart';
import 'package:german/home/simples_EXR.dart';
import 'package:german/services/search_A.dart';
import 'package:german/services/searcn_S.dart';
import 'package:german/services/translate.dart';
import 'package:german/services/splash_screen.dart';
import 'package:german/home/examples.dart';
import 'package:german/home/expression.dart';
import 'package:german/home/situation.dart';
import 'package:german/layout/layout.dart';
import 'package:german/services/search_B.dart';
import 'package:german/layout/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBne5yp5jT8zUZB5Z4KwSuzfs5V7UZ2hZI",
      appId: "1:686787612476:android:4fde0af3a4c5832a24d839",
      messagingSenderId: "686787612476-qv50ka389hbi80lhgnhsok8uq2l058uf.apps.googleusercontent.com",
      projectId: "germany-b64bb",
    ),
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
        fontFamily: 'Amiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            color: Colors.black,
            fontFamily: 'Amiri',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.black54,
            fontFamily: 'Amiri',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontFamily: 'Amiri',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          headline4:TextStyle(
            color: Colors.black,
            fontFamily: 'Amiri',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.white,
            fontFamily: 'Amiri',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.black,
            fontFamily: 'Amiri',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routname: (BuildContext) => Splash(),
        StartScreen.routName: (BuildContext) => StartScreen(),
        Layout.routName: (BuildContext) => Layout(),
        homeScreen.routname: (BuildContext) => homeScreen(),
        TranslateScreen.routName: (BuildContext)=> TranslateScreen(),
        Examples.routName: (BuildContext)=> Examples(),
        Situation.routName: (BuildContext)=> Situation(),
        Expression.routName: (BuildContext)=> Expression(),
        search_A.routName:(BuildContext)=> search_A(),
        search_B.routName:(BuildContext)=> search_B(),
        search_S.routName:(BuildContext)=> search_S(),
        Simples_EXm.routName:(BuildContext)=> Simples_EXm(),
        Simples_EXr.routName:(BuildContext)=> Simples_EXr(),
      },
      initialRoute: Splash.routname,
    );
  }
}
