class ManualLocalization {
  static String getPropertyCategoryEnglishWord(String word) {
    if (word == 'سكني' || word == 'residential') {
      return 'residential';
    }
    if (word == 'تجاري' || word == 'commercial') {
      return 'commercial';
    }
    if (word == 'coastal' || word == 'مصيفي') {
      return 'coastal';
    }
    return 'none';
  }

  static String getPostTypeEnglishWord(String word) {
    if (word == 'توربو' || word == 'Turbo') {
      return 'turbo';
    }
    if (word == 'توربو بلس' || word == 'Turbo Plus') {
      return 'turboPlus';
    }
    if (word == 'عادي' || word == 'Standard') {
      return 'normal';
    }
    return 'none';
  }
}
