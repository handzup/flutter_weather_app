import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SunPosition extends StatelessWidget {
  static final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/city.flr");
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width / 2,
        height: 150,
        child: FlareCacheBuilder([asset],
            builder: (BuildContext context, bool isWarm) {
          return !isWarm
              ? CupertinoActivityIndicator()
              : FlareActor.asset(
                  asset,
                  shouldClip: true,
                  animation: 'city',
                  fit: BoxFit.cover,
                  antialias: false,
                );
        }),
      ),
    );
  }
}
