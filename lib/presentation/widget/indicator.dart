import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Indicator extends StatelessWidget {
  final String animationName;
  static final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  final Color color;
  final String stat;

  const Indicator(
      {Key key,
      @required this.animationName,
      this.color = Colors.green,
      this.stat})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(16))),
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
        SizedBox(
          height: 5,
        ),
        Text(
          stat,
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }
}
