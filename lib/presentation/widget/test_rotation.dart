import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/presentation/widget/sun_position.dart';
import 'package:vector_math/vector_math.dart' as Matrux;

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
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    rotation = Tween<double>(begin: 0.0, end: 180)
        .animate(CurvedAnimation(curve: Curves.linear, parent: _controller));
    translation = Tween<double>(begin: 0.0, end: 180.0)
        .animate(CurvedAnimation(curve: Curves.easeIn, parent: _controller));
    super.initState();
  }

  _buildButton(double angle) {
    final rad = Matrux.radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
            (translation.value) * cos(rad), (translation.value) * sin(rad)),
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
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF5594fe), blurRadius: 12, spreadRadius: 1)
            ],
            gradient: LinearGradient(
                colors: [Color(0xFFa9c9ff), Color(0xFF5594fe)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            border: Border.all(color: Colors.grey[200], width: 0.5),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 220,
                    height: 150,
                  ),
                  Positioned(
                    left: 80,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, builder) {
                        return Transform.rotate(
                          angle: Matrux.radians(rotation.value),
                          child: _buildButton(-180),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: SunPosition()),
                  ),
                  Positioned(
                      child: InkWell(
                    child: Icon(Icons.burst_mode),
                    onTap: () {
                      if (index >= 1.0) {
                        index -= 0.1;
                        _controller.animateBack(index);
                      } else {
                        index += 0.1;
                        _controller.animateTo(index);
                      }
                    },
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
