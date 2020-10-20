import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/svg_icons.dart';
import 'indicator.dart';

class AnimatedCardContainer extends StatefulWidget {
  final int index;
  const AnimatedCardContainer({
    Key key,
    this.index,
  }) : super(key: key);
  @override
  _AnimatedCardContainerState createState() => _AnimatedCardContainerState();
}

class _AnimatedCardContainerState extends State<AnimatedCardContainer> {
  final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  @override
  initState() {
    super.initState();
    isDone = widget.index == 0 ? true : false;
    secondConainer = widget.index == 0 ? true : false;
  }

  bool isDone = false;
  bool secondConainer = false;

  tap() {
    setState(() {
      isDone = !isDone;
    });
    if (!isDone) {
      Future.delayed(Duration(milliseconds: 250)).then((value) => setState(() {
            secondConainer = !secondConainer;
          }));
    } else {
      setState(() {
        secondConainer = !secondConainer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          tap();
        },
        child: Padding(
          padding: !isDone
              ? EdgeInsets.only(top: 0, bottom: 0, right: 16.0, left: 16.0)
              : EdgeInsets.only(top: 16, bottom: 16, right: 16.0, left: 16.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            alignment: FractionalOffset.center,
            height: !secondConainer ? 80 : 280,
            child: AnimatedContainer(
              alignment: FractionalOffset.center,
              duration: Duration(milliseconds: 300),
              height: !isDone ? 80 : 280,
              decoration: !isDone
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFFFFF), Color(0xFFFFFFF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFFFF),
                        )
                      ],
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF5594fe),
                            blurRadius: 12,
                            spreadRadius: 1)
                      ],
                      gradient: LinearGradient(
                          colors: [Color(0xFFa9c9ff), Color(0xFF5594fe)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      border: Border.all(color: Colors.grey[200], width: 0.5),
                    ),
              child: !isDone ? _collapsedWidget() : _expandedWidget(),
            ),
          ),
        ));
  }

  Widget _collapsedWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mon',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.blueGrey[400]),
          ),
          Row(
            children: [
              Text(
                '17/',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.blueGrey[400]),
              ),
              Text(
                ' 15°',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.blueGrey[400], fontSize: 18),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: SvgPicture.asset(
                SvgKeys.wi_day_sleet_storm,
                width: 40,
                height: 40,
                color: Colors.blueGrey[400],
              )),
              SizedBox(
                width: 15,
              ),
              Text(
                'Storm',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.blueGrey[400]),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _expandedWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tomorrow',
                style: Theme.of(context).textTheme.headline1.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                'Sun,7 Aug',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('20',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white)),
                    Text('Cloudy',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.white))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('/17 ',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white, fontSize: 40)),
                  ],
                ),
                Container(
                  width: 40,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('°C',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Indicator(
                iconColor: Colors.blueAccent,
                textColor: Colors.white,
                iconName: SvgKeys.wi_night_alt_cloudy_windy,
                backgrpundColor: Colors.white,
                stat: '90km/h',
              ),
              Indicator(
                iconColor: Colors.red,
                textColor: Colors.white,
                iconName: SvgKeys.wi_night_alt_cloudy_windy,
                backgrpundColor: Colors.white,
                stat: '43%',
              ),
              Indicator(
                iconColor: Colors.green,
                textColor: Colors.white,
                iconName: SvgKeys.wi_night_alt_cloudy_windy,
                backgrpundColor: Colors.white,
                stat: '16%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
