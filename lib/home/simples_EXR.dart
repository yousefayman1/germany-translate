import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:german/models/expression_model.dart';
import 'package:german/services/search_B.dart';
import '../models/exa_in_Expression.dart';
import '../services/audio.dart';

class Simples_EXr extends StatefulWidget {
  static const String routName = 'Simples_EXr';
  const Simples_EXr({Key? key}) : super(key: key);

  @override
  State<Simples_EXr> createState() => _Simples_EXrState();
}

class _Simples_EXrState extends State<Simples_EXr> {
  var typeController = TextEditingController();
  var notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var exr = ModalRoute.of(context)!.settings.arguments as expressionModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/logooo.png',
          height: 120.0,
          width: 200.0,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  search_B.routName,
                );
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 52, 73, 94),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 52, 73, 94),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 20),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      exr.transFrom,
                      style: Theme.of(context)
                          .textTheme
                          .headline5,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      exr.transTo,
                      style: Theme.of(context)
                          .textTheme
                          .headline5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          StreamBuilder<QuerySnapshot<Exr>>(
            stream: Exr.withconverter(exr.id).snapshots(),
            builder: (builder, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('empty'),
                );
              }
              var trans = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (buildContext, index) {
                  return Column(
                    children: [
                      shape(trans.elementAt(index)),
                    ],
                  );
                },
                shrinkWrap: true,
                itemCount: trans.length,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget shape(Exr trans) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        title: Text(
          '${trans.exp}',
          style: Theme.of(context)
              .textTheme
              .headline1,
        ),
        subtitle: Text(
          '${trans.translate}',
          style: Theme.of(context)
              .textTheme
              .headline2,
        ),
        trailing: MaterialButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              speak(trans.exp);
            }),
      ),
    );
  }
}
