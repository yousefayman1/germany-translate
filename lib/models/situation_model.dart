import 'package:cloud_firestore/cloud_firestore.dart';

class situationModel{
  static const String collectionName = 'situations';
  String transFrom;
  String transTo;
  int index;
  String id;

  situationModel({required this.transFrom,required this.transTo,required this.index,required this.id});

  Map<String, dynamic> toJson() {
    return {
      'transFrom':transFrom,
      'transTo' : transTo,
      'index' : index,
      'Id' : id,
    };
  }
  situationModel.fromJson(Map<String, dynamic> json)
      : this(
    transFrom: json['transFrom'] as String,
    transTo: json['transTo'] as String,
    index: json['index'] as int,
    id: json['Id'] as String,
  );

  static CollectionReference<situationModel> withConverter(){
    return FirebaseFirestore.instance.collection(collectionName)
        .withConverter<situationModel>(
        fromFirestore: (snapshot, _) => situationModel.fromJson(snapshot.data()!),
        toFirestore: (situationModel, _) => situationModel.toJson());
  }
}