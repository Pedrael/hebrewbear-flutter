import 'package:flutter/material.dart';
import 'package:hebrewbear/layouts/addword/addword.dart';
class HebrewBearSidebar extends StatelessWidget {

  const HebrewBearSidebar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const ListTile(
              title: Text("Menu", style: TextStyle(fontSize: 20),),
              textColor: Colors.white,
              tileColor: Colors.green,
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
