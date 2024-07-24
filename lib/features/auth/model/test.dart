class Localization {
  static String getLanguage(String code) {
    switch (code) {
      case 'en':
        return "English";
      case 'id':
        return "Indonesian";
      default:
        return "en";
    }
  }
}
