// Example file
// ignore_for_file: avoid_print, specify_nonobvious_property_types

import 'package:zodart/zodart.dart';

String toTrendyUpperCase(String val) => '🔥 ${val.trim().toUpperCase()}';
String toFlashySuffix(String val) => '$val ✨';

List<T> revertList<T>(List<T> val) => val.reversed.toList();

final zString = ZArray(ZString().process(toTrendyUpperCase).process(toFlashySuffix)).process(revertList);

void main() {
  final res = zString.parse([' zodart ', 'world   ', '  hello']);

  print(res.value); // [🔥 HELLO ✨, 🔥 WORLD ✨, 🔥 ZODART ✨]
}
