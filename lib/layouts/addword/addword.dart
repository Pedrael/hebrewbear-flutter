// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/data/word.dart';
import 'package:hebrewbear/layouts/wordslist/swipetest.dart';
import 'package:hebrewbear/widgets/dropdown.dart';
import 'package:provider/provider.dart';

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
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        validator: (value) {
                          //final validChars = RegExp(letters.values.join());
                          final validChars = RegExp(r'^[\u0590-\u05FF\u200f\u200e ]+$');
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if(!validChars.hasMatch(value)) {
                            return 'Only Hebrew allowed';
                          }
                          return null;
                        },
                        controller: rootController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter root',
                        ),
                      ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                      onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Provider.of<WordsListNotifier>(context, listen: false).words.add(Word(
                            rootController.text,
                            translateController.text,
                            typeController
                          ));
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => WordsList(),
                          ), );
                          // Navigator.pop(context, Word(
                          //   rootController.text,
                          //   translateController.text,
                          //   typeController
                          // ));
                        }
                      },
                      child: Text('Add'),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    ElevatedButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => WordsList(),
                      ), );
                    }, child: Text('Back'))
                  ],),
                ]),
            ),
          )
        ),
      );
  }
}