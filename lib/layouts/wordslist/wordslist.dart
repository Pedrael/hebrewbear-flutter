import 'package:flutter/material.dart';
import 'package:hebrewbear/widgets/cell.dart';
import '../conjugation/layout.dart';
import 'word.dart';

class WordsList extends StatelessWidget {

  final items = List<Word>.generate(20, (index) => Word("לחמ", "translate $index", "type $index"));
  final double cellWidth = 168;

  WordsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      //ignore: prefer_const_literals_to_create_immutables
      columnWidths: {
        0: const FlexColumnWidth(3),
        1: const FlexColumnWidth(3),
        2: const FlexColumnWidth(3),
        3: const IntrinsicColumnWidth(), 
        4: const IntrinsicColumnWidth(), 
        5: const IntrinsicColumnWidth(), 
        6: const IntrinsicColumnWidth(),
      },
      //defaultColumnWidth: const IntrinsicColumnWidth(),
      border: const TableBorder(verticalInside: BorderSide(color: Colors.black26, width: 1.0)),
      children: [
        ...List.generate(items.length, (index) => TableRow(
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.black12 : Colors.transparent,
          ),
          children: [
            HebrewBearCell(child: items[index].buildRoot(context)),
            HebrewBearCell(child: items[index].buildTranslate(context)),
            HebrewBearCell(child: items[index].buildType(context)),
            HebrewBearCell(child: ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Conjugation(word: items[index])
              ));
            }, child: const Text('Present')),),
            HebrewBearCell(child: ElevatedButton(onPressed: () {}, child: const Text('Past')),),
            HebrewBearCell(child: ElevatedButton(onPressed: () {}, child: const Text('Future')),),
            HebrewBearCell(child: Material(
              color: Colors.transparent,
              child: Center(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.deepOrange,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    hoverColor: Colors.transparent,
                    color: Colors.white,
                    //padding: const EdgeInsets.all(32.0),
                    onPressed: () {},
                  ),
                ),
              ),
            )),
          ]
        )),
      ],
    );
  }
}