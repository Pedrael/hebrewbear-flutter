import 'package:flutter/material.dart';
import 'package:hebrewbear/layouts/addword/addword.dart';
class HebrewBearSidebar extends StatelessWidget {

  const HebrewBearSidebar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Drawer(
        backgroundColor: Theme.of(context).canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            AppBar(
              title: const Text("Menu"),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: const Icon(Icons.plus_one),
              title: const Text('Add word', style: TextStyle(fontSize: 16),),
              onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AddWord(
                    type: 'word',
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
