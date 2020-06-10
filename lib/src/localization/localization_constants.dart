import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_localization.dart';

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).getTranslatedValue(key);
}

const String ENGLISH = 'en';
const String URDU = 'ur';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;

    case URDU:
      _temp = Locale(languageCode, 'PK');
      break;

    default:
      _temp = Locale(ENGLISH, 'US');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? 'ENGLISH';           //    ?? stands for (if this is NULL)
  return _locale(languageCode);
}
