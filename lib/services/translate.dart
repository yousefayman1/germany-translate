import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslateScreen extends StatefulWidget {
  static const String routName = 'Translate';
  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  var output;
  String? dropdownValue;

  static const Map<String, String> lang = {
    "German": "de",
    "English": "en",
    "Arabic": "ar",
  };

  void trans() {
    translator
        .translate(textEditingController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: Image.asset(
          'assets/images/logooo.png',
          height: 120.0,
          width: 200.0,
        ),
        backgroundColor: const Color.fromARGB(255, 52, 73, 94),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    top: 30,
                  ),
                  child: Text(
                    "Enter text in any language",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  width: 10,
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 8, left: 8),
              child: TextFormField(
                controller: textEditingController,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                onChanged: (value) {
                  setState(() {
                    trans();
                  });
                },
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  prefixIcon: Icon(
                    Icons.abc,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.black,
                  labelText: 'Type Here',
                  labelStyle: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Translated Text",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 10,
                  )),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down_circle),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black38,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        trans();
                      });
                    },
                    items: lang
                        .map((string, value) {
                          return MapEntry(
                            string,
                            DropdownMenuItem(
                              value: value,
                              child: Text(string,style: Theme.of(context)
                                  .textTheme
                                  .headline1,),
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey),
                child: Center(
                  child: Text(
                    output == null
                        ? "Please Select Language"
                        : output.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
