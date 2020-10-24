import 'package:flutter/material.dart';
import 'package:univest/routes/routes_name.dart';
class aboutPage extends StatefulWidget {
  @override
  _aboutPageState createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'),),
      body: Center(
        child: RaisedButton(child: Text('go to setting')
          ,onPressed:(){Navigator.pushNamed(context, settingRoute); },),
      ),
    );
  }
}
