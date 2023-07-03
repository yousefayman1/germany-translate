import 'package:flutter_tts/flutter_tts.dart';

Future speak(text) async {
  final FlutterTts tts = FlutterTts();
  await tts.setLanguage("de");
  await tts.setPitch(1);
  await tts.speak(text);
}
