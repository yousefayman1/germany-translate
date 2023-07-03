import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:german/models/examples_in_EXM.dart';
import 'package:german/services/search_A.dart';
import '../services/audio.dart';

class Simples_EXm extends StatefulWidget {
  static const String routName = 'Simples_EXm';
  const Simples_EXm({Key? key}) : super(key: key);

  @override
  State<Simples_EXm> createState() => _Simples_EXmState();
}

class _Simples_EXmState extends State<Simples_EXm> {
  var typeController = TextEditingController();
  var notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
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
                  search_A.routName,
                );
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 52, 73, 94),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Exm>>(
        stream: Exm.withconverter(id).snapshots(),
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
    );
  }

  Widget shape(Exm trans) {
    return Card(
      margin: EdgeInsetsDirectional.all(8),
      elevation: 10,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                '${trans.exp}',
                style:Theme.of(context)
                    .textTheme
                    .headline1,
              ),
            ),
          ),
          MaterialButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                speak(trans.exp);
              }),
        ],
      ),
    );
  }
}
