import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/next_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Settings', style: Theme.of(context).textTheme.bodyText1),
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            back(context);
          },
          icon: Icon(
            CupertinoIcons.arrow_down,
          ),
        ),
      ),
      body: Container(
        color: Colors.transparent,
      ),
    );
  }
}
