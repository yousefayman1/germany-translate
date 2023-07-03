import 'package:flutter/material.dart';
import '../home/examples.dart';
import '../home/expression.dart';
import '../home/situation.dart';

class homeScreen extends StatefulWidget {
  static const String routname = 'homeScreen';
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back22.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                        right: Radius.circular(40),
                      ),
                    ),
                    child: MaterialButton(
                      child: Center(
                        child: Text(
                          "Begriff",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Expression.routName,
                        );
                      },
                    ),
                  ),
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 210, 48, 48),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(40),
                        )),
                    child: MaterialButton(
                      child: Center(
                        child: Text(
                          "Alltägliches",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Examples.routName,
                        );
                      },
                    ),
                  ),
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 218, 218, 64),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(40),
                        )),
                    child: MaterialButton(
                      child: Center(
                        child: Text(
                          "Sprichwörtlich",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Situation.routName,
                        );
                      },
                    ),
                  ),
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
