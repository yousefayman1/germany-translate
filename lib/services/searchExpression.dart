import 'package:flutter/material.dart';
import 'package:german/models/expression_model.dart';

class searchExpression extends StatefulWidget {
  final expressionModel? trans;

  searchExpression({ required this.trans});

  @override
  State<searchExpression> createState() => _searchExpressionState();
}

class _searchExpressionState extends State<searchExpression> {
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
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.trans!.transFrom,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 4),
                      //   child: Text(
                      //     widget.trans!.transTo,
                      //     style: TextStyle(
                      //         fontSize: 10,
                      //         color: Colors.black87,
                      //         fontWeight: FontWeight.w400),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
