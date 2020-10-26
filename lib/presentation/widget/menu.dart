import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/core/next_screen.dart';
import 'package:flutter_weather_app/presentation/next_7_days.dart';

import '../search_page.dart';
import '../settings_page.dart';

class Menu extends StatelessWidget {
  static final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(
          flex: 2,
        ),
        Row(
          children: [
            Icon(CupertinoIcons.plus),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () => upToDown(context, SearchPage()),
                child: Text("Add City",
                    style: Theme.of(context).textTheme.bodyText1)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(CupertinoIcons.settings_solid),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () => downToUp(context, SettingsPage()),
              child: Text("Settings",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Container(
            width: MediaQuery.of(context).size.width / 3.5,
            height: MediaQuery.of(context).size.height / 3.5,
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
      ],
    );
  }
}
