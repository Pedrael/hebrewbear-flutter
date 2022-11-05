import 'package:flutter/material.dart';
import 'package:hebrewbear/layouts/addword/addword.dart';

class HebrewBearSidebar extends StatelessWidget {

  const HebrewBearSidebar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // SizedBox(
          //   height: 64.0,
          //   child: const DrawerHeader(
          //     decoration: BoxDecoration(
          //       color: Colors.green,
          //     ),
          //   ),
          // ),
          ListTile(
            //leading: Icon(Icons.donut_large),
            title: Text('Add verb'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddWord(
                  type: 'verb',
                ),
              )),
          ),
          ListTile(
            //leading: const Icon(Icons.account_balance),
            title: const Text('Add noun'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nigger'))
              );
            },
          ),
        ],
      ),
    );
  }

}

// Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => Conjugation(
//                           word: context.read<WordsListNotifier>().words[index], //context.read<WordsListNotifier>().words[index], 
//                           infinitive: createInfinitive(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type),
//                           result: conjugatePresent(context.watch<WordsListNotifier>().words[index].root, context.watch<WordsListNotifier>().words[index].type), 
//                           time: 'Present')
//                         ));