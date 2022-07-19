import 'package:forsencode_dart/forsencode_dart.dart';
import 'package:test/test.dart';

void main() {
  test('ForsenCode Encode test 1', () {
    expect(toForsenCode("qwerty"), "ForseN ForSEN FOrSeN ForsEn ForSen FoRseN");
  });

  test('ForsenCode Encode test 2', () {
    expect(toForsenCode("rust Randers 🚀 🦀"),
        "ForsEn ForSeN ForsEN ForSen fOrsen FörsEn FOrseN FORSEn FOrSen FOrSeN ForsEn ForsEN fOrsen 🚀 🦀");
  });
}
