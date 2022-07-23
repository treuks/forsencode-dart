import 'dart:io';

import 'package:forsencode_dart/forsencode_dart.dart' as forsencode_dart;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: forsencode [encode|decode] <text>');
    exit(1);
  }

  var text = arguments.getRange(1, arguments.length).join(' ');

  if (arguments[0] == 'encode') {
    print(forsencode_dart.toForsenCode(text));
  } else if (arguments[0] == 'decode') {
    print(forsencode_dart.fromForsenCode(text));
  } else {
    print('Usage: forsencode [encode|decode] <text>');
  }
}
