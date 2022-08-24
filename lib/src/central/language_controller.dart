import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LanguagesAvailable { en_US, arabic }

class LanguageController {
  static String? lastLanguage;
  static setLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    lastLanguage = pref.getString('lastLanguage');

    Get.updateLocale(Locale(lastLanguage ?? 'en_US'));
  }
}
