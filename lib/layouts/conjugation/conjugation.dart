import 'package:flutter/material.dart';
import 'package:hebrewbear/widgets/table.dart';
import '../../widgets/cell.dart';
import '../../data/word.dart';

class Conjugation extends StatelessWidget {

  const Conjugation({
    super.key, 
    required this.word, 
    required this.infinitive, 
    required this.result, 
    required this.time
  });

  final String time;
  final Word word;
  final Map <String, String> infinitive;
  final Map <String, String> result;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${infinitive.values.first} - ${word.translate}, $time tense"),
        actions: [
          IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HebrewBearTable(
                  children: [
                    ...List.generate(result.length, (index) => TableRow(
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.black12 : Colors.transparent,
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        HebrewBearCell(child: Text(result.keys.elementAt(index))),
                        HebrewBearCell(child: Text(result.values.elementAt(index))),
                      ]
                    ))
                  ],
                )
              ]),)
      );
  }

}