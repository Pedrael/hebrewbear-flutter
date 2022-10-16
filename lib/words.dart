import 'package:flutter/material.dart';
import 'package:hebrewbear/cell.dart';

class WordsList extends StatelessWidget {

  final items;
  final double cellWidth = 168;

  const WordsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          color: index % 2 == 0 ? Colors.black12 : Colors.transparent,
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HebrewBearCell(width: cellWidth, child: item.buildRoot(context),),
              HebrewBearCell(width: cellWidth, child: item.buildTranslate(context),),
              HebrewBearCell(width: cellWidth, child: item.buildType(context),),
              HebrewBearCell(width: cellWidth, child: ElevatedButton(onPressed: () {}, child: const Text('Present')),),
              HebrewBearCell(width: cellWidth, child: ElevatedButton(onPressed: () {}, child: const Text('Past')),),
              HebrewBearCell(width: cellWidth, child: ElevatedButton(onPressed: () {}, child: const Text('Future')),),
            ]
        ),);
      }
      );
  }
}
