class ExpressionValidator {
  static bool nomEqualString(int nom, String char) => nom == int.parse(char);

  static bool isThisFeatureExist(String val, List vector) {
    for (String e in vector) {
      if (e == val) return true;
    }
    return false;
  }

  static bool isCash(String payment) {
    if (payment == 'Cash' || payment == 'نقداً') {
      return true;
    }
    return false;
  }
}
