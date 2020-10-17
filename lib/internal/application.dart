import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/widget/test_bloc.dart';
import 'package:provider/provider.dart';

import '../core/theme.dart';
import '../presentation/home.dart';
import '../presentation/widget/drawer.dart';
import '../presentation/widget/menu.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  GlobalKey myKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Styles.themeData(false, context),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<TestBloc>(
            create: (context) => TestBloc(),
          )
        ],
        child: CustomDrawer(
          myKey: myKey,
          body: Home(mykey: myKey),
          menu: Menu(),
        ),
      ),
    );
  }
}
