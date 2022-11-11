import 'package:flutter/material.dart';
import 'package:hebrewbear/data/conjugation.dart';
//import 'package:hebrewbear/data/alphabet.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/widgets/cell.dart';
import '../conjugation/conjugation.dart';
//import '../../data/word.dart';
class WordsListOld extends StatelessWidget {

  //final items = List<Word>.generate(20, (index) => Word("${letters['alef']}${vowels['A']}${letters['gimel']}", "translate $index", "type $index"));
  final items = [];
  final double cellWidth = 168;

  WordsListOld({super.key});

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

            HebrewBearCell(child: DBtypes.contains(items[index].type) ? ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Conjugation(
                  word: items[index], 
                  infinitive: createInfinitive(items[index].root, items[index].type),
                  result: conjugatePresent(items[index].root, items[index].type), 
                  time: 'Present')
              ));
              }, child: const Text('Present')) : const SizedBox.shrink()
              ),

            HebrewBearCell(child: DBtypes.contains(items[index].type) ? ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Conjugation(
                  word: items[index], 
                  infinitive: createInfinitive(items[index].root, items[index].type),
                  result: conjugatePast(items[index].root, items[index].type), 
                  time: 'Past')
              ));
              }, child: const Text('Past')) : const SizedBox.shrink()
              ),

            HebrewBearCell(child: DBtypes.contains(items[index].type) ? ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Conjugation(
                  word: items[index], 
                  infinitive: createInfinitive(items[index].root, items[index].type),
                  result: conjugateFuture(items[index].root, items[index].type), 
                  time: 'Future')
              ));
              }, child: const Text('Future')) : const SizedBox.shrink()
              ),

            // HebrewBearCell(child: Material(
            //   color: Colors.transparent,
            //   child: Center(
            //     child: Ink(
            //       decoration: const ShapeDecoration(
            //         color: Colors.deepOrange,
            //         shape: CircleBorder(),
            //       ),
            //       child: IconButton(
            //         icon: const Icon(Icons.delete),
            //         hoverColor: Colors.transparent,
            //         color: Colors.white,
            //         //padding: const EdgeInsets.all(32.0),
            //         onPressed: () {},
            //       ),
            //     ),
            //   ),
            // )),
          ]
        )),
      ],
    );
  }
}