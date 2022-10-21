import 'package:flutter/material.dart';

class HebrewBearTable extends StatelessWidget {

  const HebrewBearTable({
    super.key, 
    required this.children, 
    });

  final List <TableRow> children;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        verticalInside: BorderSide(
          color: Colors.black26, width: 1.0,
        )
      ),
      children: children,
    );
  }
}