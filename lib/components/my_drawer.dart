import 'package:flutter/material.dart';
import 'package:gossip_v01/pages/about.dart';
import 'package:gossip_v01/pages/setting.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Icon(
              Icons.message_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 41,
            ),
          ),
          //chats
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text("C H A T S"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          //settings includes change theme and logout
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
              onTap: () {
                //pop the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
              },
            ),
          ),
          //about
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("A B O U T"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
