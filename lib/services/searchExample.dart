import 'package:flutter/material.dart';
import 'package:german/home/simples_EXM.dart';
import 'package:german/models/example_model.dart';

class searchExample extends StatefulWidget {
  final exampleModel? req;

  searchExample({ required this.req});

  @override
  State<searchExample> createState() => _searchExampleState();
}

class _searchExampleState extends State<searchExample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color.fromARGB(255, 218, 218, 218);
          } else {
            return Colors.white;
          }
        }),
            elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return 20;
          } else {
            return 0;
          }
        })),
        onPressed: () {
          Navigator.pushNamed(context, Simples_EXm.routName,
              arguments: widget.req?.id,
          );
        },
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.req!.title,
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
