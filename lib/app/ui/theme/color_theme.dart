// :root {
//   --red: #dd082f;
//   --dark-red: #3b020d;
//   --green: #2ff901;
//   --yellow: #ffcc02;
//   --sky: #01fbfb;
//   --orange: #ffcc02;
//   --blue: #519afb;
//   font-size: 16px;
// }
import 'package:flutter/material.dart';

class MainColor {
  static Color red = fromHex('#dd082f');
  static Color darkRed = fromHex('#3b020d');
  static Color green = fromHex('#2ff901');
  static Color yellow = fromHex('#ffcc02');
  static Color sky = fromHex('#01fbfb');
  static Color orange = fromHex('#ffcc02');
  static Color blue = fromHex('#519afb');

  static Color screen = fromHex('#b0b0b0');
}

Color fromHex(String hexString) {
  final StringBuffer buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
