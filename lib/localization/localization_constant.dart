import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univest/localization/demo_localization.dart';

String getTranslated(BuildContext context, String key){
  return DemoLocalizations.of(context).getTranslatedValue(key);
}

const String ENGLISH = 'en';
const String HINDI = 'hi';
const String FARSI = 'fa';
const String ARABIC = 'ar';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale>setLocale(String languageCode)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.setString(LANGUAGE_CODE, languageCode);
return  _locale(languageCode);
}

Locale _locale(String languageCode){
  Locale _temp;
  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;
    case HINDI:
      _temp = Locale(languageCode, 'IN');
      break;
    case ARABIC:
      _temp = Locale(languageCode, 'SA');
      break;
    case FARSI:
      _temp = Locale(languageCode, 'IR');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
  }
  return _temp;
}


Future<Locale>getLocale()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LANGUAGE_CODE)??ENGLISH;
  return  _locale(languageCode);
}