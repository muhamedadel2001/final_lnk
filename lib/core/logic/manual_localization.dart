class ManualLocalization {
  static String getPropertyCategoryEnglishWord(String word) {
    if (word == 'سكني' || word == 'Residential') {
      return 'residential';
    }
    if (word == 'تجاري' || word == 'Commercial') {
      return 'commercial';
    }
    if (word == 'Coastal' || word == 'مصيفي') {
      return 'costal';
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
