// import 'package:german/models/example_model.dart';
// import 'package:german/models/examples_in_EXM.dart';
// import 'package:german/models/expression_model.dart';
// import 'package:german/models/situation_model.dart';
//
// import 'exa_in_Expression.dart';
//
// class useWithconverter {
//
//   static Future<void> setExp(exampleModel exp) {
//     var _exp = exampleModel.withConverter().doc(exp.id).set(exp);
//     return _exp;
//   }
//
//   static Future<void> setSit(situationModel exp) {
//     var _sit = situationModel.withConverter().doc(exp.id).set(exp);
//     return _sit;
//   }
//
//   static Future<void> setExr(expressionModel exp) {
//     var _exr = expressionModel.withConverter().doc(exp.id).set(exp);
//     return _exr;
//   }
//
//   static Future<void> setSimExr(Exr exp,String id) {
//     var _exr = Exr.withconverter(id).doc().set(exp);
//     return _exr;
//   }
//
//   static Future<void> setSim(Exm sim,String id) {
//     var _his = Exm.withconverter(id).doc().set(sim);
//     return _his;
//   }
//
// }