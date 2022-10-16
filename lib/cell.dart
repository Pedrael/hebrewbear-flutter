import 'package:flutter/material.dart';

class HebrewBearCell extends StatelessWidget {

  final Widget child;
  final double width;

  const HebrewBearCell({super.key, required this.child, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black26, width: 0),
          right: BorderSide(color: Colors.black26, width: 0),
        ),
      ),
      child: Center(
        child: child,
      )
    );
  }
}