import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:german/home/simples_EXM.dart';
import 'package:german/services/search_A.dart';
import '../models/example_model.dart';
import '../services/audio.dart';

class Examples extends StatefulWidget {
  static const String routName = 'Examples';
  const Examples({Key? key}) : super(key: key);

  @override
  State<Examples> createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  var typeController = TextEditingController();
  var notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 199,199,199),
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
      body: StreamBuilder<QuerySnapshot<exampleModel>>(
        stream: exampleModel.withConverter().snapshots(),
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

  Widget shape(exampleModel trans) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(5)
            ),
        child: MaterialButton(
          height: 55,
          onPressed: () {
            Navigator.pushNamed(context, Simples_EXm.routName,
                arguments: trans.id);
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${trans.title}',
                  style: Theme.of(context)
                      .textTheme
                      .headline1,
                ),
              ),
              MaterialButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: () {
                    speak(trans.title);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
