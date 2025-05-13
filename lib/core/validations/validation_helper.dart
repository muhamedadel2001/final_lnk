import '../util/lang_keys.dart';

class Validations {
  static String? egyptianPhoneValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }
    final cleaned = val.trim();
    final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

    if (!regex.hasMatch(cleaned)) {
      return LangKeys.phoneValid; // اعمل مفتاح الترجمة ده في lang
    }
    return null;
  }

  static String? passwordValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    } else {
      if (val.length < 9) {
        return LangKeys.passValid;
      }
    }
    return null;
  }

  static String? globalValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }
    return null;
  }
}
