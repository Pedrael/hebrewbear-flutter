// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddWord extends StatelessWidget {

  const AddWord({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new $type"),
        actions: [
          IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back))
          ],
        ),
        body: Center(
          child: SizedBox(
            width: 300.0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter root',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter translate',
                    ),
                  ),
                ),
              ]),
          ),
        ),
      );
  }
}