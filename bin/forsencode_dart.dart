import 'package:forsencode_dart/forsencode_dart.dart' as forsencode_dart;

void main(List<String> arguments) {
  var stdin = arguments.join(" ");
  print(forsencode_dart.toForsenCode(stdin));
}
