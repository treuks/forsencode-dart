import 'package:forsencode_dart/forsencode_dart.dart' as forsencode_dart;
import 'dart:io';

void main(List<String> arguments) async {
  try {
    var file = await File(arguments.join(" ")).readAsString();
    print(forsencode_dart.toForsenCode(file));
  } on FileSystemException {
    print("Error: File not entered");
    exit(1);
  }
}
