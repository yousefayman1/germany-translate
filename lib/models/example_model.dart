import 'package:cloud_firestore/cloud_firestore.dart';

class exampleModel{
  static const String collectionName = 'examples';
  String title;
  int index;
  String id;

  exampleModel({required this.title,required this.index,required this.id});

  Map<String, dynamic> toJson() {
    return {
      'title':title,
      'index' : index,
      'Id':id,
    };
  }
  exampleModel.fromJson(Map<String, dynamic> json)
      : this(
    title: json['title'] as String,
    index: json['index'] as int,
    id: json['Id'] as String,
  );

  static CollectionReference<exampleModel> withConverter(){
    return FirebaseFirestore.instance.collection(collectionName)
        .withConverter<exampleModel>(
        fromFirestore: (snapshot, _) => exampleModel.fromJson(snapshot.data()!),
        toFirestore: (exampleModel, _) => exampleModel.toJson());
  }
}