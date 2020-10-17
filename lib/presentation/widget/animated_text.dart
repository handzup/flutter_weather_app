import 'dart:ui';
import 'dart:math' as math;

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/presentation/widget/test_bloc.dart';
import 'package:provider/provider.dart';

class AnimatedText extends StatefulWidget {
  final ScrollController scrollController;
  const AnimatedText({
    Key key,
    @required this.scrollController,
  }) : super(key: key);
  @override
  _AnimatedTextState createState() => _AnimatedTextState(
        scrollController: scrollController,
      );
}

class _AnimatedTextState extends State<AnimatedText> {
  static const double kExpandedHeight = 160.0;
  ScrollController scrollController;
  static const double kInitialSize = 20.0;
  List<String> list = ['UNITED KINGDOM', 'London', 'California'];
  static const double kFinalSize = 18.0;
  bool visble = false;
  final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");

  _AnimatedTextState({
    this.scrollController,
  });

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {});
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        setState(() {
          visble = true;
        });
      } else {
        setState(() {
          visble = false;
        });
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    getString();
    super.didChangeDependencies();
  }

  void getString() {
    final bb = Provider.of<TestBloc>(context);
    setState(() {
      list = bb.list;
    });
  }

  Widget c() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 30,
              height: 30,
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
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: 12)),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('°C',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = !scrollController.hasClients || scrollController.offset == 0
        ? 20.0
        : 20 -
            math.min(
                2.0,
                (2 /
                    kExpandedHeight *
                    math.min(scrollController.offset, kExpandedHeight) *
                    2.2));
    double t = (size - kInitialSize) / (kFinalSize - kInitialSize);
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 10),
      child: Row(
        children: [
          Expanded(child: buildAppBarBottom(size, list, t)),
          visble
              ? c()
              : SizedBox(
                  height: 30,
                )
        ],
      ),
    );
  }

  Widget buildAppBarBottom(double size, List<String> list, double t) {
    const double initialContainerHeight = 2 * kInitialSize;
    const double finalContainerHeight = kFinalSize;
    return Container(
      height: lerpDouble(initialContainerHeight, finalContainerHeight, t),
      child: LayoutBuilder(
        builder: (context, constraints) {
          List<Widget> stackChildren = [];
          if (t == 1) {
            for (int i = 0; i < 2; i++) {
              Offset offset = getInterpolatedOffset(i, constraints, t);
              if (i > 0 && i < 2) {
                stackChildren.add(Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: buildSizedBox(size, list[i] + ',' + list[i + 1], i),
                ));
              } else {
                stackChildren.add(Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: buildSizedBox(size, list[i], i),
                ));
              }
            }
          } else {
            for (int i = 0; i < 3; i++) {
              Offset offset = getInterpolatedOffset(i, constraints, t);
              if (i > 0 && t == 1 && i < 2) {
                stackChildren.add(Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: buildSizedBox(size, list[i] + ',' + list[i + 1], i),
                ));
              } else {
                stackChildren.add(Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: buildSizedBox(size, list[i], i),
                ));
              }
            }
          }

          return Stack(
            alignment: Alignment.topLeft,
            overflow: Overflow.visible,
            children: stackChildren,
          );
        },
      ),
    );
  }

  List<GlobalKey> keys = [GlobalKey(), GlobalKey(), GlobalKey()];
  Offset getInterpolatedOffset(
      int index, BoxConstraints constraints, double t) {
    Curve curve = Curves.linear;
    double curveT = curve.transform(t);

    Offset a = getOffset(index, constraints, kInitialSize, 1, t);
    Offset b = getOffset(index, constraints, kFinalSize, 3, t);

    return Offset(
      lerpDouble(a.dx, b.dx, curveT),
      lerpDouble(a.dy, b.dy, curveT),
    );
  }

  double calculatePrev(int index, double t) {
    double temp = 0.0;
    if (index != 0) {
      for (var i = index - 1; i >= 0; i--) {
        temp += lerpDouble(0, 12, t) * list[i].length;
      }
    } else {
      return temp;
    }
    return temp;
  }

  Offset getOffset(
      int index, BoxConstraints constraints, double size, int columns, t) {
    int y = index ~/ columns;

    double horizontalMargin = calculatePrev(index, t);
    return Offset(horizontalMargin * t, y * -lerpDouble(25, 80, t));
  }

  Widget buildSizedBox(double size, String text, int index) {
    if (index == 0)
      return Text(
        text,
        key: keys[index],
        style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: size),
      );
    return Text(
      text,
      key: keys[index],
      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: size),
    );
  }
}
