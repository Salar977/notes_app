import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Header
          const SizedBox(
            height: 250,
            child: Icon(Icons.note, size: 40,),
          ),

          // notes tile
          DrawerTile(
            title: "Notes",
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          )

        ],
      ),
    );
  }
}