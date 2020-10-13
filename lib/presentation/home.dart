import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/presentation/widget/indicator.dart';
import 'package:flutter_weather_app/presentation/widget/sun_position.dart';
import 'package:flutter_weather_app/presentation/widget/test_rotation.dart';

import 'widget/today_weather.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '02d';
  final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LONDON,',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'United Kingdom',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sat,6 Aug',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Today',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 120,
                        height: 120,
                        child: FlareCacheBuilder([asset],
                            builder: (BuildContext context, bool isWarm) {
                          return !isWarm
                              ? CupertinoActivityIndicator()
                              : FlareActor.asset(
                                  asset,
                                  shouldClip: true,
                                  animation: '02d',
                                  fit: BoxFit.contain,
                                );
                        })),
                    Column(
                      children: [
                        Text('20',
                            style: Theme.of(context).textTheme.headline2),
                        Text('Cloudy',
                            style: Theme.of(context).textTheme.bodyText2)
                      ],
                    ),
                    Container(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('°C',
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Indicator(
                      animationName: 'wind',
                      color: Colors.green[200],
                      stat: '90km/h',
                    ),
                    Indicator(
                      animationName: 'wind',
                      color: Colors.red[200],
                      stat: '90km/h',
                    ),
                    Indicator(
                      animationName: '01d',
                      color: Colors.blue[200],
                      stat: '90km/h',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            TodayWeather(),
            SizedBox(
              height: 20,
            ),
            TestRotation(),
          ],
        ),
      ),
    );
  }
}