import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hebrewbear/data/conjugation.dart';
//import 'package:hebrewbear/data/alphabet.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/widgets/cell.dart';

import 'conjugation/conjugation.dart';
//import '../../data/word.dart';
class SwipeTable extends StatelessWidget {

  //final items = List<Word>.generate(20, (index) => Word("${letters['alef']}${vowels['A']}${letters['gimel']}", "translate $index", "type $index"));
  final items = DBwords;
  final double cellWidth = 168;

  SwipeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(items.length, (index) => Slidable(
            startActionPane: ActionPane(
              motion: const BehindMotion(),
              extentRatio: 0.08,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
            ]) ,
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              extentRatio: 0.30,
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Conjugation(
                      word: items[index], 
                      infinitive: createInfinitive(items[index].root, items[index].type),
                      result: conjugatePresent(items[index].root, items[index].type), 
                      time: 'Present')
                    ));
                  }, child: const Text('Present')),

                  ElevatedButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Conjugation(
                      word: items[index], 
                      infinitive: createInfinitive(items[index].root, items[index].type),
                      result: conjugatePast(items[index].root, items[index].type), 
                      time: 'Past')
                    ));
                  }, child: const Text('Past')),

                  ElevatedButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Conjugation(
                      word: items[index], 
                      infinitive: createInfinitive(items[index].root, items[index].type),
                      result: conjugatePresent(items[index].root, items[index].type), 
                      time: 'Future')
                    ));
                  }, child: const Text('Future')),

              ]),
            child: ListTile(
              contentPadding: EdgeInsets.all(8.0),
              tileColor: index % 2 == 0 ? Colors.black12 : Colors.transparent,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(items[index].root),
                    ),
                    Expanded(
                      child: Text(items[index].translate),
                    ),
                    Expanded(
                      child: Text(items[index].type),
                    )
                  ],
                )
            )
          )
        )
      ],
    );
  }
}