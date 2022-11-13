// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbmanager.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WordsSchemaData extends DataClass implements Insertable<WordsSchemaData> {
  final int id;
  final String root;
  final String translate;
  final String type;
  const WordsSchemaData(
      {required this.id,
      required this.root,
      required this.translate,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['root'] = Variable<String>(root);
    map['translate'] = Variable<String>(translate);
    map['type'] = Variable<String>(type);
    return map;
  }

  WordsSchemaCompanion toCompanion(bool nullToAbsent) {
    return WordsSchemaCompanion(
      id: Value(id),
      root: Value(root),
      translate: Value(translate),
      type: Value(type),
    );
  }

  factory WordsSchemaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordsSchemaData(
      id: serializer.fromJson<int>(json['id']),
      root: serializer.fromJson<String>(json['root']),
      translate: serializer.fromJson<String>(json['translate']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'root': serializer.toJson<String>(root),
      'translate': serializer.toJson<String>(translate),
      'type': serializer.toJson<String>(type),
    };
  }

  WordsSchemaData copyWith(
          {int? id, String? root, String? translate, String? type}) =>
      WordsSchemaData(
        id: id ?? this.id,
        root: root ?? this.root,
        translate: translate ?? this.translate,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('WordsSchemaData(')
          ..write('id: $id, ')
          ..write('root: $root, ')
          ..write('translate: $translate, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, root, translate, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordsSchemaData &&
          other.id == this.id &&
          other.root == this.root &&
          other.translate == this.translate &&
          other.type == this.type);
}

class WordsSchemaCompanion extends UpdateCompanion<WordsSchemaData> {
  final Value<int> id;
  final Value<String> root;
  final Value<String> translate;
  final Value<String> type;
  const WordsSchemaCompanion({
    this.id = const Value.absent(),
    this.root = const Value.absent(),
    this.translate = const Value.absent(),
    this.type = const Value.absent(),
  });
  WordsSchemaCompanion.insert({
    this.id = const Value.absent(),
    required String root,
    required String translate,
    required String type,
  })  : root = Value(root),
        translate = Value(translate),
        type = Value(type);
  static Insertable<WordsSchemaData> custom({
    Expression<int>? id,
    Expression<String>? root,
    Expression<String>? translate,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (root != null) 'root': root,
      if (translate != null) 'translate': translate,
      if (type != null) 'type': type,
    });
  }

  WordsSchemaCompanion copyWith(
      {Value<int>? id,
      Value<String>? root,
      Value<String>? translate,
      Value<String>? type}) {
    return WordsSchemaCompanion(
      id: id ?? this.id,
      root: root ?? this.root,
      translate: translate ?? this.translate,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (root.present) {
      map['root'] = Variable<String>(root.value);
    }
    if (translate.present) {
      map['translate'] = Variable<String>(translate.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsSchemaCompanion(')
          ..write('id: $id, ')
          ..write('root: $root, ')
          ..write('translate: $translate, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $WordsSchemaTable extends WordsSchema
    with TableInfo<$WordsSchemaTable, WordsSchemaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsSchemaTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _rootMeta = const VerificationMeta('root');
  @override
  late final GeneratedColumn<String> root = GeneratedColumn<String>(
      'root', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _translateMeta = const VerificationMeta('translate');
  @override
  late final GeneratedColumn<String> translate = GeneratedColumn<String>(
      'translate', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, root, translate, type];
  @override
  String get aliasedName => _alias ?? 'words_schema';
  @override
  String get actualTableName => 'words_schema';
  @override
  VerificationContext validateIntegrity(Insertable<WordsSchemaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('root')) {
      context.handle(
          _rootMeta, root.isAcceptableOrUnknown(data['root']!, _rootMeta));
    } else if (isInserting) {
      context.missing(_rootMeta);
    }
    if (data.containsKey('translate')) {
      context.handle(_translateMeta,
          translate.isAcceptableOrUnknown(data['translate']!, _translateMeta));
    } else if (isInserting) {
      context.missing(_translateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordsSchemaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordsSchemaData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      root: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}root'])!,
      translate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}translate'])!,
      type: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $WordsSchemaTable createAlias(String alias) {
    return $WordsSchemaTable(attachedDatabase, alias);
  }
}

abstract class _$WordsDB extends GeneratedDatabase {
  _$WordsDB(QueryExecutor e) : super(e);
  late final $WordsSchemaTable wordsSchema = $WordsSchemaTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wordsSchema];
}
