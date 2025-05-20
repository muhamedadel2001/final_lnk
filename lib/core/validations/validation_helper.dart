import '../util/lang_keys.dart';

class Validations {
  static final RegExp _arabicRegex = RegExp(r'[\u0600-\u06FF]');

  static String? egyptianPhoneValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }

    final cleaned = val.trim();

    if (_arabicRegex.hasMatch(cleaned)) {
      return LangKeys.phoneValid;
    }

    final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    if (!regex.hasMatch(cleaned)) {
      return LangKeys.phoneValid; // اعمل مفتاح الترجمة ده في lang
    }

    return null;
  }

  static String? passwordValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }

    if (val.length < 9) {
      return LangKeys.passValid;
    }

    if (_arabicRegex.hasMatch(val)) {
      return LangKeys.passValid;
    }

    return null;
  }

  static String? globalValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }
    return null;
  }

  static String? emailValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }

    if (!val.contains('@gmail.com')) {
      return LangKeys.validEmail;
    }

    if (_arabicRegex.hasMatch(val)) {
      return LangKeys.validEmail;
    }

    return null;
  }
}
