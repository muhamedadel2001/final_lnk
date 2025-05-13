import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class IntlLogic {
  static bool isEnglish() {
    dynamic context;
    String currentLocale = context.locale.languageCode;
    if (currentLocale == 'en') return true;
    return false;
  }
}
