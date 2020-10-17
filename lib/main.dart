import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'internal/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Application());
}

// import 'dart:math' as math;
// import 'dart:ui';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: Home()));
// }

// class Home extends StatefulWidget {
//   @override
//   State createState() => HomeState();
// }

// class HomeState extends State<Home> {
//   static const double kExpandedHeight = 200.0;

//   static const double kInitialSize = 20.0;

//   static const double kFinalSize = 15.0;

//   static const List<Color> kBoxColors = [
//     Colors.red,
//     Colors.green,
//     Colors.yellow,
//     Colors.purple,
//     Colors.orange,
//     Colors.grey,
//   ];

//   ScrollController _scrollController = new ScrollController();
//   GlobalKey _key = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       setState(() {/* State being set is the Scroll Controller's offset */});
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     double size = !_scrollController.hasClients || _scrollController.offset == 0
//         ? 20.0
//         : 20 -
//             math.min(
//                 5.0,
//                 (5 /
//                     kExpandedHeight *
//                     math.min(_scrollController.offset, kExpandedHeight) *
//                     1.5));
//     print(' Size ^ $size');
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: <Widget>[
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: kExpandedHeight,
//             leading: InkWell(
//                 onTap: () {
//                   //   print(keys[0].currentContext.size.width);
//                   print('1 char size: ${keys[0].currentContext.size.width}');
//                 },
//                 child: Icon(Icons.access_alarm)),
//             bottom:
//                 // title: size == 30 ? Text('sdads') : SizedBox.shrink(),
//                 PreferredSize(
//                     preferredSize: Size.fromHeight(24),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Flexible(child: buildAppBarBottom(size)),
//                         ])),
//           ),
//           SliverFixedExtentList(
//             itemExtent: 20.0,
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return ListTile(title: Text('Item $index'));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildAppBarBottom(double size) {
//     double t = (size - kInitialSize) / (kFinalSize - kInitialSize);
//     if (t > 1) {
//       // print(t);
//     }
//     const double initialContainerHeight = 2 * kInitialSize;
//     const double finalContainerHeight = kFinalSize;
//     return Container(
//       height: lerpDouble(initialContainerHeight, finalContainerHeight, t),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           List<Widget> stackChildren = [];
//           for (int i = 0; i < 3; i++) {
//             Offset offset = getInterpolatedOffset(i, constraints, t);
//             stackChildren.add(Positioned(
//               left: offset.dx,
//               top: offset.dy,
//               child: buildSizedBox(size, str[i], i),
//             ));
//           }

//           return Stack(
//             overflow: Overflow.visible,
//             children: stackChildren,
//           );
//         },
//       ),
//     );
//   }

//   List<GlobalKey> keys = [GlobalKey(), GlobalKey(), GlobalKey()];
//   Offset getInterpolatedOffset(
//       int index, BoxConstraints constraints, double t) {
//     Curve curve = Curves.linear;
//     double curveT = curve.transform(t);

//     Offset a = getOffset(index, constraints, kInitialSize, 1, t);
//     Offset b = getOffset(index, constraints, kFinalSize, 3, t);

//     return Offset(
//       lerpDouble(a.dx, b.dx, curveT),
//       lerpDouble(a.dy, b.dy, curveT),
//     );
//   }

//   double calculatePrev(int index, double t) {
//     double temp = 0.0;
//     if (index != 0) {
//       for (var i = index - 1; i >= 0; i--) {
//         temp += lerpDouble(13, 10, t) * str[i].length;
//       }
//     } else {
//       return temp;
//     }
//     //print(lerpDouble(13, 10, t) * str[0].length);
//     return temp;
//   }

//   Offset getOffset(
//       int index, BoxConstraints constraints, double size, int columns, t) {
//     int x = index % columns;
//     int y = index ~/ columns;

//     // print('index $index: ${lerpDouble(41, 17, t) * str[index].length} ');
//     double horizontalMargin = calculatePrev(index, t);
//     print('index: $index ^ $horizontalMargin');
//     return Offset(horizontalMargin * t, y * size);
//   }

//   List<String> str = ['UNITED KINGDOM', 'London', 'Sun 6'];
//   Widget buildSizedBox(double size, String color, int index) {
//     return Text(
//       color,
//       key: keys[index],
//       style: TextStyle(
//           color: Colors.black,
//           fontSize: size,
//           fontFamily: 'GT Eesti Pro',
//           fontWeight: FontWeight.w600),
//     );
//   }
// }
