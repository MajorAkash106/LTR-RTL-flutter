import 'package:flutter/material.dart';
import 'package:univest/localization/localization_constant.dart';
import 'package:univest/main.dart';

import 'classes/languagelist.dart';
class settingPage extends StatefulWidget {
  @override
  _settingPageState createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {

  void _changelanguage(Language language) async{
    Locale _temp = await setLocale(language.languageCode);

    MyApp.setLocale(context, _temp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getTranslated(context, 'settings')),
        actions: <Widget>[
          DropdownButton(
            onChanged: (Language language) {
              print(language.languageCode);
              _changelanguage(language);
            },
            underline: SizedBox(),
            icon: Icon(Icons.language,color: Colors.white,),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                value: lang,
                child: Row(
                  children: <Widget>[Text(lang.name)],
                )))
                .toList(),
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}
