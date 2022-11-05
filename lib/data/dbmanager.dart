import 'package:flutter/material.dart';
import 'package:hebrewbear/data/word.dart';

const List<String> DBtypes = [
  "Paal",
  "Piel",
  "Hiphil",
  "Hitpael",
  "Nifal",
  "Pual",
  "Hufal",
];

class WordsListNotifier with ChangeNotifier {

  // ignore: prefer_final_fields
  List<Word> _words = [
  Word('מכר', 'sell1', 'Paal'),
  Word('מכר', 'sell2', 'Piel'),
  Word('מכר', 'sell3', 'Hiphil'),
  Word('מכר', 'sell', 'Noun'),
  Word('מכר', 'sell', 'Adjective'),
];

int _counter = 0;

int get counter => _counter;

void pp() {
  _counter++;
  notifyListeners();
}

  List<Word> get words => _words;

  void add(Word w) {
    _words.add(w);
    notifyListeners();
  }

  void remove(int i) {
    _words.removeAt(i);
    notifyListeners();
  }
}