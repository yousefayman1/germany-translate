import 'package:cloud_firestore/cloud_firestore.dart';

class expressionModel{
  static const String collectionName = 'expressions';
  String transFrom;
  String transTo;
  int index;
  String id;

  expressionModel({required this.transFrom,required this.transTo,required this.index,required this.id});

  Map<String, dynamic> toJson() {
    return {
      'transFrom':transFrom,
      'transTo' : transTo,
      'index' : index,
      'Id' : id,
    };
  }
  expressionModel.fromJson(Map<String, dynamic> json)
      : this(
    transFrom: json['transFrom'] as String,
    transTo: json['transTo'] as String,
    index: json['index'] as int,
    id: json['Id'] as String,
  );

  static CollectionReference<expressionModel> withConverter(){
    return FirebaseFirestore.instance.collection(collectionName)
        .withConverter<expressionModel>(
        fromFirestore: (snapshot, _) => expressionModel.fromJson(snapshot.data()!),
        toFirestore: (expressionModel, _) => expressionModel.toJson());
  }
}