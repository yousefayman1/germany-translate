// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:german/layout/home_screen.dart';
import 'package:german/services/translate.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);
  static const String routName = 'Layout';

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [
    homeScreen(),
    TranslateScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home,size: 27,color: Colors.white),
      Icon(Icons.g_translate,size: 27,color: Colors.white),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor:  Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 300),
        color:  Color.fromARGB(255, 52, 73, 94),
        index: currentIndex,
        backgroundColor: Colors.white,
        buttonBackgroundColor:  Color.fromARGB(255, 52, 73, 94),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        height: 50,
        items:items,
      ),
    );
  }
}
