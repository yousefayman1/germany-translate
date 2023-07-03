import 'package:cloud_firestore/cloud_firestore.dart';

class Exm{
  static const String collectionName = 'examples';
  String exp;

  Exm({required this.exp });

  Map<String, dynamic> toJson() {
    return {
      'Exp' : exp,
    };
  }
  Exm.fromJson(Map<String, dynamic> json)
      : this(
    exp: json['Exp'] as String,
  );

  static CollectionReference<Exm>withconverter(String uId){
    return FirebaseFirestore.instance.collection(collectionName)
        .doc(uId).collection('Simples')
        .withConverter<Exm>(
        fromFirestore: (snapshot, _) => Exm.fromJson(snapshot.data()!),
        toFirestore: (Exm, _) => Exm.toJson());
  }

}