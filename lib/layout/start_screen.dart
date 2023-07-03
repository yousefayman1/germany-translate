import 'package:flutter/material.dart';
import 'package:german/layout/layout.dart';

class StartScreen extends StatefulWidget {
  static const String routName = 'StartScreen';
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/back11.jpg"),
                    fit: BoxFit.cover)),
          )),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SBA',
                        style: Theme.of(context)
                            .textTheme
                            .headline4,),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Diese Anwendung eine Reihe von Begriffen, Einstellungen und Ausdrucken ,die das Sprachenlernen und die Entwicklung von Konversationsfahigkeiten erleichtern.',
                    style: Theme.of(context)
                        .textTheme
                        .headline1,),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15)),
                        child: MaterialButton(
                          child: Center(
                            child: Text("Tippen Sie, um fortzufahren",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3,),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Layout.routName, (route) => false);
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
