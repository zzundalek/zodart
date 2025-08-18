// Example file
// ignore_for_file: avoid_print

import 'package:zodart/zodart.dart';

void main() {
  final zString = ZString().nullable().onNull(() => 'default value');

  print(zString.parse('ZodArt').value); // ZodArt
  print(zString.parse(null).value); // default value
}
