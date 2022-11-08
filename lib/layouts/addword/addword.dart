// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/widgets/dropdown.dart';
import 'package:provider/provider.dart';

import '../../data/word.dart';

class AddWord extends StatelessWidget {

  AddWord({super.key, required this.type});

  final String type;
  final _formKey = GlobalKey<FormState>();
  final rootController = TextEditingController();
  final translateController = TextEditingController();
  final listItems = DBtypes;
  String typeController = DBtypes.first;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add new $type"),
        actions: [
          IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back))
          ],
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 300.0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: rootController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter root',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: translateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter translate',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: HebrewBearDropdown(
                      listItems: listItems,
                      defaultItem: typeController,
                      onChanged: (String newValue) => {
                      typeController = newValue
                    },),
                  ),
                  ElevatedButton(
                    onPressed: () {
                           // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //final text = _formKey.currentState.toString();
                        //print(rootController.text + " " + translateController.text + " " + typeController);
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        Provider.of<WordsListNotifier>(context, listen: false).words.add(Word(
                          rootController.text,
                          translateController.text,
                          typeController
                        ));
                        // context.read<WordsListNotifier>().words.add(Word(
                        //   rootController.text,
                        //   translateController.text,
                        //   typeController
                        // ));
                        print(context.read<WordsListNotifier>().words.toString() + "!");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Item added")),
                        );
                      }
                    },
                    child: Text('Add'),
                  )
                ]),
            ),
          )
        ),
      );
  }
}