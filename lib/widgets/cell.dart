import 'package:flutter/material.dart';

class HebrewBearCell extends StatelessWidget {

  final Widget child;

  const HebrewBearCell({super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
        ),
      );
  }
}