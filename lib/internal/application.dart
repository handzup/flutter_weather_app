import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/home.dart';
import 'package:flutter_weather_app/presentation/widget/drawer.dart';
import 'package:flutter_weather_app/presentation/widget/menu.dart';

import '../core/theme.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Styles.themeData(false, context),
      home: CustomDrawer(
        body: Home(),
        menu: Menu(),
      ),
    );
  }
}
