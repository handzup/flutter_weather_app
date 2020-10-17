import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class CustomDrawer extends StatefulWidget {
  final Widget menu;
  final Widget body;

  const CustomDrawer({Key key, @required this.menu, @required this.body})
      : super(key: key);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 100);
  AnimationController _controller;
  AnimationController _sliverController;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;
  Animation<Offset> _slideAnimation2;
  ScrollController _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);

    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);

    _slideAnimation2 = Tween<Offset>(begin: Offset(0, 0), end: Offset(0.5, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  collapseCustomDrawer() {
    setState(
      () {
        if (isCollapsed)
          _controller.forward();
        else
          _controller.reverse();

        isCollapsed = !isCollapsed;
      },
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: widget.menu,
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return SlideTransition(
      position: _slideAnimation2,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform.rotate(
              angle: _controller.value * -pi / 30,
              child: Stack(overflow: Overflow.visible, children: [
                Positioned(
                  left: -20,
                  right: 0,
                  bottom: 30,
                  top: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: Theme.of(context).shadowColor,
                            offset: Offset(-5, 0.0),
                            spreadRadius: 10)
                      ],
                      borderRadius: _controller.value == 0.0
                          ? BorderRadius.all(Radius.circular(0))
                          : BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          color: Theme.of(context).shadowColor,
                          offset: Offset(-5, 0.0),
                          spreadRadius: 10)
                    ],
                    borderRadius: _controller.value == 0.0
                        ? BorderRadius.all(Radius.circular(0))
                        : BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ClipRRect(
                    borderRadius: _controller.value == 0.0
                        ? BorderRadius.all(Radius.circular(0))
                        : BorderRadius.all(Radius.circular(20)),
                    child: NestedScrollView(
                      controller: _scrollController,
                      physics: NeverScrollableScrollPhysics(),
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [
                          SliverAppBar(
                            expandedHeight: height,
                            pinned: true,
                            elevation: 0,
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: _isShrink,
                              titlePadding: _isShrink
                                  ? EdgeInsets.only(
                                      left: 50.0,
                                    )
                                  : EdgeInsets.only(left: 16.0, right: 16.0),
                              title: _isShrink
                                  ? SizedBox.shrink()
                                  : SingleChildScrollView(
                                      child: AnimatedBuilder(
                                          animation: _sliverController,
                                          builder: (context, builder) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'LONDON,',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                ),
                                                Text(
                                                  'United Kingdom',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Sat,6 Aug',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                            ),
                            forceElevated: innerBoxIsScrolled,
                            automaticallyImplyLeading: true,
                            centerTitle: true,
                            title: _isShrink
                                ? Row(
                                    children: [
                                      Text(
                                        'LONDON,',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        'United Kingdom',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Sat,6 Aug',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink(),
                            leading: IconButton(
                              splashColor: Theme.of(context).shadowColor,
                              splashRadius: 20,
                              onPressed: () => collapseCustomDrawer(),
                              icon: SvgPicture.asset(
                                'assets/images/drawer.svg',
                                height: 10,
                              ),
                            ),
                          )
                        ];
                      },
                      body: widget.body,
                    ),
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
