import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:german/models/expression_model.dart';
import 'package:german/services/searchExpression.dart';

class search_B extends StatefulWidget {
  static const String routName = 'search_B';

  @override
  State<search_B> createState() => _search_BState();
}

class _search_BState extends State<search_B> {
  late QuerySnapshot searchSnapshot;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(190, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 9, 45),
        title: Image.asset(
          "assets/images/logooo.png",
          width: 120,
          height: 120,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontFamily: 'Amiri'),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'search with germany',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Text('Begriff', style: Theme.of(context).textTheme.headline1),
            SizedBox(height: 3),
            expressionList(name),
          ],
        ),
      ),
    );
  }

  Widget expressionList(String _userNameEditingController) {
    return StreamBuilder<QuerySnapshot<expressionModel>>(
        stream: expressionModel
            .withConverter()
            .where('transFrom',
                isGreaterThanOrEqualTo: _userNameEditingController)
            .snapshots(),
        builder: (builder, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('empty'),
            );
          }
          var trans = snapshot.data?.docs.map((e) => e.data()).toList();
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: trans?.length,
              itemBuilder: (BuildContext, index) {
                return Column(
                  children: [
                    searchExpression(
                      trans: trans?.elementAt(index),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                );
              });
        });
  }
}
