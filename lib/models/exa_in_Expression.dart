import 'package:cloud_firestore/cloud_firestore.dart';

class Exr{
  static const String collectionName = 'expressions';
  String exp;
  String translate;
  Exr({required this.exp ,required this.translate});

  Map<String, dynamic> toJson() {
    return {
      'Ger' : exp,
      'Ara':translate,

    };
  }
  Exr.fromJson(Map<String, dynamic> json)
      : this(
    exp: json['Ger'] as String,
    translate: json['Ara'] as String,
  );

  static CollectionReference<Exr>withconverter(String uId){
    return FirebaseFirestore.instance.collection(collectionName)
        .doc(uId).collection('Simples')
        .withConverter<Exr>(
        fromFirestore: (snapshot, _) => Exr.fromJson(snapshot.data()!),
        toFirestore: (Exr, _) => Exr.toJson());
  }

}