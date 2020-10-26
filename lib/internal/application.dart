import 'package:flutter/material.dart';
import '../presentation/widget/test_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TestBloc>(
          create: (context) => TestBloc(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(false, context),
          home: CustomDrawer(
            body: Home(),
            menu: Menu(),
          )),
    );
  }
}
