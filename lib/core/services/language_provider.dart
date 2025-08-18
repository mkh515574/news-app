import 'package:flutter/cupertino.dart';
import 'package:news_app/core/services/shared_prefs.dart';

class LanguageProvider extends ChangeNotifier {
  String language = "en";

  void changeLanguage(String lang) {
    language = lang;
    saveLanguage(lang);
    notifyListeners();
  }

  String getLanguage() {
    return language;
  }

  void initLanguage({required String lang}) {
    language = lang;

  }
}
