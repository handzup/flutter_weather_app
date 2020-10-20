import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/next_screen.dart';
import '../next_7_days.dart';
import 'hourly_forecast.dart';

class TodayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today', style: Theme.of(context).textTheme.bodyText1),
              GestureDetector(
                onTap: () {
                  nextScreen(context, Next7Days());
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Next 7 Days',
                        style: Theme.of(context).textTheme.headline4),
                    Transform.rotate(
                        angle: pi,
                        child: Icon(
                          CupertinoIcons.arrow_left,
                          size: 20,
                          color: Color(0xFF1565C0),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HourlyForecast();
            },
          ),
        )
      ],
    );
  }
}
