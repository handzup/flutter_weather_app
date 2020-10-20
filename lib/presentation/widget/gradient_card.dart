import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final Widget child;

  const GradientCard({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: child),
    );
  }
}
