import 'package:flutter/material.dart';
import 'package:univest/about_page.dart';
import 'package:univest/classes/languagelist.dart';
import 'package:univest/localization/localization_constant.dart';
import 'package:univest/main.dart';
import 'package:univest/routes/routes_name.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // void _changelanguage(Language language) async{
  //   Locale _temp = await setLocale(language.languageCode);
  //
  //   MyApp.setLocale(context, _temp);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'home_page')),
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: DropdownButton(
          //       onChanged: (Language language) {
          //         print(language.languageCode);
          //         _changelanguage(language);
          //       },
          //       underline: SizedBox(),
          //       icon: Icon(Icons.language),
          //       items: Language.languageList()
          //           .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
          //               value: lang,
          //               child: Row(
          //                 children: <Widget>[Text(lang.name)],
          //               )))
          //           .toList(),
          //     ),
          //   )
          // ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  child: Container(
                height: 100,
                child: CircleAvatar(),
              )),
              ListTile(
                title: Text(getTranslated(context, 'about_us')),
                onTap: () {
                  Navigator.pushNamed(context, aboutRoute);
                },
              ),
              ListTile(
                title: Text(getTranslated(context, 'settings')),
                onTap: () {
                  Navigator.pushNamed(context, settingRoute);
                },
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: mainForm(context),
        ));
  }

  Form mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              getTranslated(context, 'personal_info'),
              style: TextStyle(fontSize: 20),
            ),
            height: MediaQuery.of(context).size.height / 8,
          ),
          Text(
            '${getTranslated(context, 'about')} 😎😎',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10,),
          TextFormField(
            validator: (val) {
              if (val.isEmpty)
                return getTranslated(context, 'required_field');
              else
                return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'name'),
                hintText: getTranslated(context, 'name_hint')),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty)
                return getTranslated(context, 'required_field');
              else
                return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'emial'),
                hintText: getTranslated(context, 'email_hint')),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text(getTranslated(context, 'submit')),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
