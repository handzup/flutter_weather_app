import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math.dart' as Matrux;

import 'gradient_card.dart';
import 'sun_position.dart';

class TestRotation extends StatefulWidget {
  @override
  _TestRotationState createState() => _TestRotationState();
}

class _TestRotationState extends State<TestRotation>
    with SingleTickerProviderStateMixin {
  double index = 0.0;
  static final asset =
      AssetFlare(bundle: rootBundle, name: "assets/flare/weather.flr");
  AnimationController _controller;
  Animation<double> rotation;
  Animation<double> translation;
  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    rotation = Tween<double>(begin: 0.0, end: 180)
        .animate(CurvedAnimation(curve: Curves.linear, parent: _controller));
    translation = Tween<double>(begin: 0.0, end: 190.0)
        .animate(CurvedAnimation(curve: Curves.easeIn, parent: _controller));
    _controller.repeat();
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  _buildButton(double angle) {
    final rad = Matrux.radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(1.4 * (translation.value) * sin(rad),
            0.1 * (translation.value) * cos(rad)),
      child: Container(
        width: 30,
        height: 30,
        child: FlareCacheBuilder([asset],
            builder: (BuildContext context, bool isWarm) {
          return !isWarm
              ? CupertinoActivityIndicator()
              : FlareActor.asset(
                  asset,
                  shouldClip: true,
                  animation: '01d',
                  antialias: false,
                  fit: BoxFit.cover,
                );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GradientCard(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 160,
                  ),
                  Positioned(
                    left: 50,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, builder) {
                        return Transform.rotate(
                          angle: Matrux.radians(rotation.value),
                          child: _buildButton(-70),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: SunPosition()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
