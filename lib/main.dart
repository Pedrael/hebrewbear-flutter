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
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        dividerColor: Colors.black12,
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: Colors.white54,
      ),
      themeMode: ThemeMode.dark,
      home: WordsList(),
    );
  }
}
