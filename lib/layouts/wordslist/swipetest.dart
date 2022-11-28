import 'package:flutter/material.dart';
import 'package:hebrewbear/data/conjugation.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/layouts/conjugation/conjugation.dart';
import 'package:hebrewbear/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class ConjugationButton extends StatelessWidget {

  const ConjugationButton({super.key, required this.time, required this.w});

  final String time;
  final WordsSchemaData w;

  Map<String, String> _getConjugation() {
    switch(time) {
      case "Present": 
        return conjugatePresent(w.root, w.type);
      case "Past":
        return conjugatePast(w.root, w.type);
      case "Future": 
        return conjugateFuture(w.root, w.type);
      default:
        return conjugatePresent(w.root, w.type);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Conjugation(
            word: w,
            infinitive: createInfinitive(w.root, w.type),
            result: _getConjugation(),
            time: time)
          ));
        }, child: Text(time)),
      );
  }
  
}
class _WordsListState extends State<WordsList> {

  final TextStyle textStyleHebrew = const TextStyle(
    fontSize: 18,
    fontFamily: 'Noto Serif Hebrew',
  );

  final filterController = TextEditingController();

  @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text("Hebrew Bear"),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: filterController,
            onChanged: (text) => setState(() {}), // rerender on filter
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search...',
            ),
          ),
        ),
        drawer: const HebrewBearSidebar(),
        body: FutureBuilder(
          future: Provider.of<WordsDB>(context).getWordsSmartFiltered(filterController.text),
          builder: (context, snapshot) {
            List<Widget> children;
            if(snapshot.hasData) {
              List<WordsSchemaData> data  = snapshot.data!;
              children = <Widget>[
                ...List.generate(data.length,
                (index) => Dismissible(
                  key: Key(data[index].toString()),
                  onDismissed: (direction) {
                    Provider.of<WordsDB>(context, listen: false).deleteWord(data[index].id);
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text("Are you sure you wish to delete this item?"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Delete")
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Cancel"),
                            ),
                          ],
                        );
                      },
                    );
                  }, // confirm dismiss
                  background: Container(color: Theme.of(context).focusColor),
                  child: data[index].type != "Noun" ? ExpansionTile(
                    title: ListTile(
                      title: Text("${createInfinitive(data[index].root, data[index].type).values.first} (${data[index].root})",
                      style: textStyleHebrew,),
                      subtitle: Text(data[index].translate),
                      trailing: Text(data[index].type),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConjugationButton(time: "Present", w: data[index]),
                            ConjugationButton(time: "Past", w: data[index]),
                            ConjugationButton(time: "Future", w: data[index]),                     
                        ],),
                      )
                    ],
                  ) : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListTile(
                      title: Text(data[index].root, style: textStyleHebrew,),
                      subtitle: Text(data[index].translate),
                      trailing: Text(data[index].type),
                    ),
                  )
                ))
              ];
            }
            else {
              children = <Widget>[
                const Center(child: Text("Data loading...")),
              ];
            }
            return ListView(
              children: children
            );
          },
        ),
      );
    }

}

class WordsList extends StatefulWidget {

  WordsList({super.key});

  @override
  State<WordsList> createState() => _WordsListState();
  
}