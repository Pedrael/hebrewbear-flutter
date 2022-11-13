import 'package:flutter/material.dart';
class Word {
  final String id;
  final String root;
  final String translate;
  final String type;

  Word(this.id, this.root, this.translate, this.type);

  Widget buildRoot(BuildContext context) => Text(root);
  Widget buildTranslate(BuildContext context) => Text(translate);
  Widget buildType(BuildContext context) => Text(type);

  @override
  String toString() {
    return "$root $translate $type";
  }

  Word.fromMap(Map<String, dynamic> word): 
    id = word["id"], root = word["root"], translate = word["translate"], type = word["type"];

  Map<String, Object> toMap(){
    return {
      'id': id,
      'root': root,
      'translate': translate,
      'type': type,
    };
  }
}