import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HourlyForecast extends StatelessWidget {
  static final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
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
              }),
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
    );
  }
}
