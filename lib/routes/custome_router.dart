import 'package:flutter/material.dart';
import 'package:univest/Not_found_page.dart';
import 'package:univest/about_page.dart';
import 'package:univest/homepage.dart';
import 'package:univest/routes/routes_name.dart';
import 'package:univest/setting_page.dart';

class CustomRouter{


  static Route<dynamic> allRoutes (RouteSettings settings){
    switch(settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (_) =>HomePage());
        break;
      case aboutRoute:
        return MaterialPageRoute(builder: (_) =>aboutPage());
        break;
      case settingRoute:
        return MaterialPageRoute(builder: (_) =>settingPage());
        break;
    }
    return MaterialPageRoute(builder: (_) =>Not_found());

  }

}