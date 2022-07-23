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

    switch ((ascii >> 4) & 3) {
      case 0:
        code.write("Ö");
        break;
      case 1:
        code.write("ö");
        break;
      case 2:
        code.write("O");
        break;
      default:
        code.write("o");
        break;
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

//
// Code kindly borrowed and translated from
// https://git.hyron.dev/foobot/foobot2/src/branch/master/src/command_handler/inquiry_helper/forsencode.rs
//
String fromForsenCode(String code) {
  var decode = "";
  for (var codeword in code.trim().split(' ')) {
    if (codeword.toLowerCase().replaceAll('ö', "o") == "forsen") {
      try {
        decode += decodeCodeword(codeword);
      } on Exception {
        decode += ' ';
      }
    } else {
      decode += codeword;
    }
  }
  return decode;
}

String decodeCodeword(String word) {
  int ascii = 0;
  var i = 6;
  int bit;
  for (var c in word.runes) {
    switch (c) {
      // fucking stupid ass language, you can't use or, so you have to split
      // these all up into several integers.
      case 102:
        // 102 = f, 114 = r, 115 = s, 101 = e, 110 = n
        bit = 0;
        break;
      case 114:
        bit = 0;
        break;
      case 115:
        bit = 0;
        break;
      case 101:
        bit = 0;
        break;
      case 110:
        bit = 0;
        break;
      case 70:
        // 70 = F, 82 = R, 83 = S, 69 = E, 78 = N
        bit = 1;
        break;
      case 82:
        bit = 1;
        break;
      case 83:
        bit = 1;
        break;
      case 69:
        bit = 1;
        break;
      case 78:
        bit = 1;
        break;
      // ----------------
      case 111:
        i -= 1;
        bit = 3;
        break;
      case 79:
        i -= 1;
        bit = 2;
        break;
      case 246:
        i -= 1;
        bit = 1;
        break;
      case 214:
        i -= 1;
        bit = 0;
        break;
      default:
        throw Exception("Invalid codeword");
    }

    ascii |= bit << i;
    i -= 1;
  }
  return String.fromCharCode(ascii);
}
