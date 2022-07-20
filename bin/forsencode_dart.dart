import 'package:forsencode_dart/forsencode_dart.dart' as forsencode_dart;
import 'dart:io';

void main(List<String> arguments) {
  try {
    var file = File(arguments.join(" ")).readAsStringSync();
    print(forsencode_dart.toForsenCode(file));
  } on FileSystemException {
    print("Error: File not entered");
    exit(1);
  }
}
