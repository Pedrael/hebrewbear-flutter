import 'package:flutter/material.dart';
import 'package:hebrewbear/data/word.dart';

const Map<String, bool> DBtypes = {
  "Paal": true,
  "Piel": true,
  "Hiphil": true,
  "Hitpael": true,
  "Nifal": true,
  "Pual": true,
  "Hufal": true,
  "Noun": false, 
  "Adjective": false, 
};

class WordsListNotifier with ChangeNotifier {

  // ignore: prefer_final_fields
  List<Word> _words = [
    Word('0', 'מכר', 'sell1', 'Paal'),
    Word('1', 'מכר', 'sell2', 'Piel'),
    Word('2', 'מכר', 'sell3', 'Hiphil'),
    Word('3', 'מכר', 'sell', 'Noun'),
    Word('4', 'מכר', 'sell', 'Adjective'),
  ];

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