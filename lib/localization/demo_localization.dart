import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

   Map<String, String> _localizedValues;

  Future load()async{
    String jsonStringvalues = await rootBundle.loadString('lib/lang/${locale.languageCode}.json');


    Map<String, dynamic> mappedJson = json.decode(jsonStringvalues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key){
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<DemoLocalizations> delegate = _DemoLocalizationsDelegate();

}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations>{
  const _DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'hi', 'ar', 'fa'].contains(locale.languageCode);;
  }

  @override
  Future<DemoLocalizations> load(Locale locale) async{
   DemoLocalizations localizations = new DemoLocalizations(locale);
   await localizations.load();
   return localizations;
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;

}