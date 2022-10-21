import 'package:flutter/material.dart';
import 'package:hebrewbear/widgets/table.dart';
import '../../widgets/cell.dart';
import '../wordslist/word.dart';

class Conjugation extends StatelessWidget {

  const Conjugation({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${word.root} - ${word.translate}"),
        actions: [
          IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back))
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HebrewBearTable(
                  children: [
                    ...List.generate(8, (index) => TableRow(
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.black12 : Colors.transparent,
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const HebrewBearCell(child: Text("text1")),
                        const HebrewBearCell(child: Text("text2")),
                      ]
                    ))
                  ],
                )
              ]),)
        ),
      );
  }

}