import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../helper/Shared_prefe/shared_prefe.dart';

class LanguageController extends GetxController {
  // Reactive variable for selected language
  var selectedLocale = const Locale('en', 'US').obs;

  // Language mapping for language name to locale
  final Map<String, Locale> languagesMap = {
    "English": const Locale('en', 'US'),
    "German": const Locale('de', 'DE'),
    "Dutch": const Locale('nl', 'NL'),
    "French": const Locale('fr', 'FR'),
  };

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  /// Change language and save selection
  void changeLanguage(String lang) async {
    Locale locale = languagesMap[lang] ?? const Locale('en', 'US');
    selectedLocale.value = locale;
    Get.updateLocale(locale);

    // Save selected language using SharePrefsHelper
    await SharePrefsHelper.setString(SharedPreferenceValue.language, lang);
  }

  /// Load saved language from SharedPreferences
  void _loadSavedLanguage() async {
    String savedLang =
    await SharePrefsHelper.getString(SharedPreferenceValue.language);

    if (savedLang.isNotEmpty && languagesMap.containsKey(savedLang)) {
      Locale locale = languagesMap[savedLang]!;
      selectedLocale.value = locale;
      Get.updateLocale(locale);
    }
  }
}
