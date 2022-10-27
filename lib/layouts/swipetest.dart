import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hebrewbear/data/conjugation.dart';
//import 'package:hebrewbear/data/alphabet.dart';
import 'package:hebrewbear/data/dbmanager.dart';

import '../data/word.dart';
import 'conjugation/conjugation.dart';
//import '../../data/word.dart';

class _WordsListState extends State<WordsList> {

    removeWord(context, index) {
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
                setState(() { widget.items.removeAt(index); })
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

      return ListView(
        children: [
          ...List.generate(widget.items.length, (index) => Container(
            color: index % 2 == 0 ? Colors.black12 : Colors.white10,
            child: Slidable(
              key: Key(widget.items[index].translate),
              startActionPane: ActionPane(
                motion: const BehindMotion(),
                extentRatio: dltBtnRatio,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.red,
                      child: IconButton(
                        color: Colors.black87,
                        highlightColor: Colors.redAccent,
                        onPressed: () { removeWord(context, index); },
                        icon: Icon(Icons.delete_forever)
                      )
                    ),
                  ),
              ]) ,
              endActionPane: widget.items[index].type != "Noun" && widget.items[index].type != "Adjective"  ? ActionPane(
                motion: const BehindMotion(),
                extentRatio: btnArrRatio,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Conjugation(
                          word: widget.items[index], 
                          infinitive: createInfinitive(widget.items[index].root, widget.items[index].type),
                          result: conjugatePresent(widget.items[index].root, widget.items[index].type), 
                          time: 'Present')
                        ));
                      }, child: const Text('Present')),
                    ),

                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Conjugation(
                            word: widget.items[index], 
                            infinitive: createInfinitive(widget.items[index].root, widget.items[index].type),
                            result: conjugatePast(widget.items[index].root, widget.items[index].type), 
                            time: 'Past')
                          ));
                        }, child: const Text('Past')),
                      ),

                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Conjugation(
                            word: widget.items[index], 
                            infinitive: createInfinitive(widget.items[index].root, widget.items[index].type),
                            result: conjugatePresent(widget.items[index].root, widget.items[index].type), 
                            time: 'Future')
                          ));
                        }, child: const Text('Future')),
                      ),

                ]) : null,
              child: ListTile(
                subtitle: Text(widget.items[index].root),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(createInfinitive(widget.items[index].root, widget.items[index].type).values.first),
                    ),
                    Expanded(
                      child: Text(widget.items[index].translate),
                    ),
                    Expanded(
                      child: Text(widget.items[index].type),
                    )
                  ],
                ),
              )
            )
          ))
        ],
      );
    }
}
class WordsList extends StatefulWidget {

  //final items = List<Word>.generate(20, (index) => Word("${letters['alef']}${vowels['A']}${letters['gimel']}", "translate $index", "type $index"));
   List<Word> items = DBwords;

  WordsList({super.key});

  _WordsListState createState() => _WordsListState();
}