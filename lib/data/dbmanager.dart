import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'dbmanager.g.dart';

class WordsSchema extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get root => text()();
  TextColumn get translate => text()();
  TextColumn get type => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'words.sqlite3'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [WordsSchema])
class WordsDB extends _$WordsDB {

  WordsDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<WordsSchemaData>> getWords() async {
    return await select(wordsSchema).get();
  }

  Future<WordsSchemaData> getWord(int id) async {
    return await (select(wordsSchema)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateWord(WordsSchemaCompanion entity) async {
    return await update(wordsSchema).replace(entity);
  }

  Future<int> insertWord(WordsSchemaCompanion entity) async {
    return await into(wordsSchema).insert(entity);
  }

  Future<int> deleteWord(int id) async {
    return await (delete(wordsSchema)..where((tbl) => tbl.id.equals(id))).go();
  }


}