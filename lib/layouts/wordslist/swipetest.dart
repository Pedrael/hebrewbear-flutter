import 'package:flutter/material.dart';
import 'package:hebrewbear/data/conjugation.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/layouts/conjugation/conjugation.dart';
import 'package:hebrewbear/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class WordsList extends StatelessWidget {

  @override
    Widget build(BuildContext context) {

      double btnArrRatio = 300.0/MediaQuery.of(context).size.width;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Hebrew Bear"),
        ),
        drawer: const HebrewBearSidebar(),
        body: FutureBuilder(
          future: Provider.of<WordsDB>(context).getWords(),
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
                              child: const Text("DELETE")
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("CANCEL"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  background: Container(color: Colors.greenAccent),
                  child: data[index].type != "Noun" ? ExpansionTile(
                    title: Container(
                      child: ListTile(
                        title: Text(data[index].root),
                        subtitle: Text(data[index].translate),
                        trailing: Text(data[index].type),
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Conjugation(
                                  word: data[index],
                                  infinitive: createInfinitive(data[index].root, data[index].type),
                                  result: conjugatePresent(data[index].root, data[index].type), 
                                  time: 'Present')
                                ));
                              }, child: const Text('Present')),
                            ),

                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Conjugation(
                                  word: data[index],
                                  infinitive: createInfinitive(data[index].root, data[index].type),
                                  result: conjugatePast(data[index].root, data[index].type),
                                  time: 'Past')
                                ));
                              }, child: const Text('Past')),
                            ),

                          Container(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Conjugation(
                                    word: data[index],
                                    infinitive: createInfinitive(data[index].root, data[index].type),
                                    result: conjugateFuture(data[index].root, data[index].type),  
                                    time: 'Future')
                                  ));
                                }, child: const Text('Future')),
                              ),
                        ],),
                      )
                    ],
                  ) : Container(
                    child: ListTile(
                      title: Text(data[index].root),
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