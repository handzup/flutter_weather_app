import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void nextScreen(context, page) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => page));
// }

// void nextScreenCloseOthers(context, page) {
//   Navigator.pushAndRemoveUntil(
//       context, MaterialPageRoute(builder: (context) => page), (route) => false);
// }

void back(context) {
  Navigator.pop(context);
}

// void nextScale(context, page, callBack) {
//   Navigator.push(
//       context,
//       PageRouteBuilder(
//           transitionDuration: Duration(milliseconds: 300),
//           transitionsBuilder: (BuildContext context,
//               Animation<double> animation,
//               Animation<double> secondaryAnimation,
//               Widget child) {
//             return ScaleTransition(
//               alignment: Alignment.center,
//               scale: CurvedAnimation(
//                 parent: animation,
//                 curve: Interval(
//                   0.00,
//                   0.50,
//                   curve: Curves.ease,
//                 ),
//               ),
//               child: child,
//             );
//           },
//           pageBuilder: (BuildContext context, Animation<double> animation,
//               Animation<double> secondaryAnimation) {
//             return page;
//           })).then((value) => callBack());
// }

// void nextScreenReplace(context, page) {
//   Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (context) => page));
// }
void upToDown(context, page) {
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, -1.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.linear,
                  ),
                ),
                child: child
                //  Scaffold(
                //   body: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //         padding: EdgeInsets.all(8),
                //         decoration: BoxDecoration(
                //             color: Color(0xFFf8fcff),
                //             borderRadius: BorderRadius.circular(20),
                //             border: Border.all(
                //                 color: Theme.of(context).shadowColor, width: 1),
                //             boxShadow: [
                //               BoxShadow(
                //                   color: Theme.of(context).shadowColor,
                //                   blurRadius: 12,
                //                   spreadRadius: 3)
                //             ]),
                //         child: child),
                //   ),
                // )
                );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          }));
}

void downToUp(context, page) {
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.linear,
                  ),
                ),
                child: child
                // Scaffold(
                //   body: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //         padding: EdgeInsets.all(8),
                //         decoration: BoxDecoration(
                //             color: Color(0xFFf8fcff),
                //             border: Border.all(
                //                 color: Theme.of(context).shadowColor, width: 1),
                //             borderRadius: BorderRadius.circular(20),
                //             boxShadow: [
                //               BoxShadow(
                //                   color: Theme.of(context).shadowColor,
                //                   blurRadius: 12,
                //                   spreadRadius: 1)
                //             ]),
                //         child: child),
                //   ),
                // )
                );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          }));
}

void nextScreen(context, page) {
  Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => page,
      ));
}

void nextScreenCloseOthers(context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    CupertinoPageRoute(builder: (context) => page),
    (route) => false,
  );
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => page));
}
