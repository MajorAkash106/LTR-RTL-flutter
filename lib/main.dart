import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:univest/localization/demo_localization.dart';
import 'package:univest/localization/localization_constant.dart';
import 'package:univest/routes/custome_router.dart';
import 'package:univest/routes/routes_name.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale locale){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
     getLocale().then((locale){
       setState(() {
         this._locale = locale;
       });
     });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    if(_locale == null){
      return Container(child: Center(child: CircularProgressIndicator(),),);
    }else
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     debugShowCheckedModeBanner: false,
     onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
      locale: _locale,
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('fa', 'IR'), // Hebrew, no country code
        const Locale('hi', 'IN'),
        const Locale('ar', 'SA'),// Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale,supportedLocales){
        for(var locale in supportedLocales){
          if(locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode){
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
