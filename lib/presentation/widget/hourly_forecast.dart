import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/svg_icons.dart';

class HourlyForecast extends StatelessWidget {
  static final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: InkWell(
        onTap: () => print('dsa'),
        child: Container(
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[200], width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('10:00'),
              Container(
                width: 40,
                height: 40,
                child: SvgPicture.asset(
                  SvgKeys.wi_day_sleet_storm,
                  width: 40,
                  height: 40,
                  color: Colors.blueGrey[400],
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('20', style: Theme.of(context).textTheme.subtitle2),
                    Text('°')
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
