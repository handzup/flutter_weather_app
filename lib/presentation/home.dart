import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/svg_icons.dart';
import 'widget/indicator.dart';
import 'widget/test_rotation.dart';
import 'widget/today_weather.dart';

class Home extends StatefulWidget {
  ValueNotifier currentPageNotifier = ValueNotifier<int>(0);
  Home({Key key, this.currentPageNotifier}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      controller: _pageController,
      onPageChanged: (int index) {
        widget.currentPageNotifier.value = index;
      },
      itemBuilder: (context, int index) {
        return FirstPage();
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Indicator(
                      iconColor: Colors.green,
                      iconName: SvgKeys.wi_night_alt_cloudy_windy,
                      backgrpundColor: Colors.green[100].withOpacity(.3),
                      stat: '90km/h',
                    ),
                    Indicator(
                      iconColor: Colors.green,
                      iconName: SvgKeys.wi_night_alt_cloudy_windy,
                      backgrpundColor: Colors.red[200].withOpacity(.3),
                      stat: '90km/h',
                    ),
                    Indicator(
                      iconColor: Colors.green,
                      iconName: SvgKeys.wi_night_alt_cloudy_windy,
                      backgrpundColor: Colors.blue[200].withOpacity(.3),
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
        )
      ],
    );
  }
}
