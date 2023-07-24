extension ValidDigit on String? {
  bool isValidDigit() {
    var length = this?.length;
    if (length != 0) {
      for (var i = 0; i < length!; i++) {
        var code = (this?.codeUnits[i]) ?? 0;
        if (!(code >= 48 && code <= 57)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  bool isValidFormetEmail() {
    String length = toString();
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(length)) {
      return true;
    }
    return false;
  }

  bool isValidName() {
    var length = this?.length;
    if (length != 0) {
      for (var i = 0; i < length!; i++) {
        var code = (this?.codeUnits[i]) ?? 0;
        if (!(code >= 65 && code <= 90 || code >= 97 && code <= 122)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }
}
