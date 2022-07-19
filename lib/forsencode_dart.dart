int calculate() {
  return 6 * 7;
}

bool isAscii(int value) {
  if (value <= 0x7F) {
    return true;
  } else {
    return false;
  }
}

String toForsenCode(String text) {
  var prevCharWasInvalid = false;
  var code = StringBuffer();
  for (var decodedChar in text.trim().runes) {
    if (code.isNotEmpty && !prevCharWasInvalid) {
      code.write(' ');
    }

    int ascii = decodedChar;

    if (!isAscii(decodedChar)) {
      prevCharWasInvalid = true;
      code.writeCharCode(decodedChar);
      continue;
    }

    if (String.fromCharCode(decodedChar) == ' ' && prevCharWasInvalid) {
      prevCharWasInvalid = false;
      continue;
    }

    if ((ascii & 64) != 0) {
      code.write("F");
    } else {
      code.write("f");
    }

    if ((ascii >> 4) & 3 == 0) {
      code.write("Ö");
    } else if ((ascii >> 4) & 3 == 1) {
      code.write("ö");
    } else if ((ascii >> 4) & 3 == 2) {
      code.write("O");
    } else {
      code.write("o");
    }

    if ((ascii & 8) != 0) {
      code.write("R");
    } else {
      code.write("r");
    }

    if ((ascii & 4) != 0) {
      code.write("S");
    } else {
      code.write("s");
    }

    if ((ascii & 2) != 0) {
      code.write("E");
    } else {
      code.write("e");
    }

    if (ascii & 1 != 0) {
      code.write("N");
    } else {
      code.write("n");
    }
    prevCharWasInvalid = false;
  }
  return code.toString();
}
