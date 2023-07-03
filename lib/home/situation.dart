import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:german/models/situation_model.dart';
import 'package:german/services/searcn_S.dart';
import '../services/audio.dart';

class Situation extends StatefulWidget {
  static const String routName = 'Situation';
  const Situation({Key? key}) : super(key: key);

  @override
  State<Situation> createState() => _SituationState();
}

class _SituationState extends State<Situation> {
  var typeController = TextEditingController();
  var notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  search_S.routName,
                );
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 52, 73, 94),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<situationModel>>(
        stream: situationModel.withConverter().snapshots(),
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
          trans.sort(
            (a, b) => a.index.compareTo(b.index),
          );
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

  Widget shape(situationModel trans) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        title: Text(
          '${trans.transFrom}',
          style: Theme.of(context)
              .textTheme
              .headline1,
        ),
        subtitle: Text(
          '${trans.transTo}',
          style: Theme.of(context)
              .textTheme
              .headline2,
        ),
        trailing: MaterialButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              speak(trans.transFrom);
            }),
      ),
    );
  }
}
