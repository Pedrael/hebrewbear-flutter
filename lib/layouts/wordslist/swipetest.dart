import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hebrewbear/data/conjugation.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/data/word.dart';
import 'package:hebrewbear/layouts/conjugation/conjugation.dart';
import 'package:hebrewbear/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class WordsList extends StatelessWidget {

  void _addWord(context, Word word) {
    Provider.of<WordsListNotifier>(context).words.add(word);
  }

  void _removeWord(context, index) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Do you want to delete the sign?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.pop(context, 'OK'),
                context.read<WordsListNotifier>().remove(index),
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

  @override
    Widget build(BuildContext context) {

      double dltBtnRatio = 60.0/MediaQuery.of(context).size.width;
      double btnArrRatio = 300.0/MediaQuery.of(context).size.width;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Hebrew Bear"),
        ),
        drawer: const HebrewBearSidebar(),
        body: ListView(
          children: [
            ...List.generate(context.read<WordsListNotifier>().words.length, (index) => Container(
              color: index % 2 == 0 ? Colors.black12 : Colors.white10,
              child: Slidable(
                key: Key(context.watch<WordsListNotifier>().words[index].translate),
                endActionPane: context.watch<WordsListNotifier>().words[index].type != "Noun" && context.watch<WordsListNotifier>().words[index].type != "Adjective"  ? ActionPane(
                  motion: const BehindMotion(),
                  extentRatio: btnArrRatio,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Conjugation(
                            word: context.read<WordsListNotifier>().words[index], //context.read<WordsListNotifier>().words[index], 
                            infinitive: createInfinitive(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type),
                            result: conjugatePresent(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type), 
                            time: 'Present')
                          ));
                        }, child: const Text('Present')),
                      ),

                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Conjugation(
                              word: context.read<WordsListNotifier>().words[index], 
                              infinitive: createInfinitive(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type),
                              result: conjugatePast(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type), 
                              time: 'Past')
                            ));
                          }, child: const Text('Past')),
                        ),

                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Conjugation(
                              word: context.read<WordsListNotifier>().words[index], 
                              infinitive: createInfinitive(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type),
                              result: conjugatePresent(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type), 
                              time: 'Future')
                            ));
                          }, child: const Text('Future')),
                        ),

                  ]) : null,
                child: ListTile(
                  onLongPress: () => _removeWord(context, index),
                  subtitle: Text(context.watch<WordsListNotifier>().words[index].root),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(createInfinitive(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type).values.first),
                      ),
                      Expanded(
                        child: Text(context.watch<WordsListNotifier>().words[index].translate),
                      ),
                      Expanded(
                        child: Text(context.watch<WordsListNotifier>().words[index].type),
                      )
                    ],
                  ),
                )
              )
            ))
          ],
        ),
      );
    }
}