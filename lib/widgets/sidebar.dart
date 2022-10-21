import 'package:flutter/material.dart';

class HebrewBearSidebar extends StatelessWidget {

  const HebrewBearSidebar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Text('Drawer'),
          ),
          const ListTile(
            //leading: Icon(Icons.donut_large),
            title: Text('Add verb'),
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