import 'package:flutter/material.dart';
class Word {
  final String root;
  final String translate;
  final String type;

  Word(this.root, this.translate, this.type);

  Widget buildRoot(BuildContext context) => Text(root);
  Widget buildTranslate(BuildContext context) => Text(translate);
  Widget buildType(BuildContext context) => Text(type);

  @override
  String toString() {
    return "$root $translate $type";
  }
}