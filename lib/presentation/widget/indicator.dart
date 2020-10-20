import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Indicator extends StatelessWidget {
  final String iconName;
  static final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  final Color backgrpundColor;
  final String stat;
  final Color textColor;
  final Color iconColor;
  const Indicator(
      {Key key,
      @required this.iconName,
      this.backgrpundColor = Colors.green,
      this.stat,
      this.iconColor = Colors.black,
      this.textColor = Colors.black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: backgrpundColor,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: iconColor, blurRadius: 20, spreadRadius: 10)
                  ]),
                ),
                SvgPicture.asset(
                  iconName,
                  width: 40,
                  height: 40,
                  color: iconColor,
                )
              ],
            )),
        SizedBox(
          height: 5,
        ),
        Text(
          stat,
          style:
              Theme.of(context).textTheme.subtitle1.copyWith(color: textColor),
        )
      ],
    );
  }
}
