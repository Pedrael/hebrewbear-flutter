import 'package:flutter/material.dart';
import 'package:hebrewbear/data/dataprovider.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/layouts/wordslist/swipetest.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MyApp());
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => WordsListNotifier()),
      Provider<WordsDB>(create: (_) => WordsDB(), dispose: (_, db) => db.close(),),
    ],
    child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hebrew Bear',
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.white70,
        primaryColor: Colors.greenAccent
      ),
      home: WordsList(),
    );
  }
}
