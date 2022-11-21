import 'package:flutter/material.dart';
import 'package:hebrewbear/data/dataprovider.dart';
import 'package:hebrewbear/data/dbmanager.dart';
import 'package:hebrewbear/layouts/wordslist/swipetest.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Flutter Demo');
    setWindowMinSize(const Size(360, 600));
    setWindowMaxSize(const Size(720, double.infinity));
  }
  
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
