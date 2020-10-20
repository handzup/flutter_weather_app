import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/next_screen.dart';
import 'widget/animated_container.dart';

class Next7Days extends StatefulWidget {
  @override
  _Next7DaysState createState() => _Next7DaysState();
}

class _Next7DaysState extends State<Next7Days> {
  int currentIndex = 0;
  bool switchDone(int index) {
    return index == currentIndex ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title:
              Text('Next 7 Days', style: Theme.of(context).textTheme.bodyText1),
          leading: IconButton(
            onPressed: () {
              back(context);
            },
            iconSize: 30,
            icon: Icon(
              CupertinoIcons.back,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, int index) {
                return AnimatedCardContainer(index: index
                    // isDone: switchDone(index),
                    // call: () {
                    //   setCurrentIndex(index);
                    // },
                    );
              }),
        ));
  }
}
