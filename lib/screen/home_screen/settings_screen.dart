import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde"),
            radius: 30,
          ),
          title: Text('Your Name'),
          subtitle: Text('Status message here'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.key),
          title: Text('Account'),
          subtitle: Text('Security notification, change number'),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Chats'),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
        ),
        ListTile(
          leading: Icon(Icons.data_usage),
          title: Text('Data and storage usage'),
        ),
      ],
    );
  }
}
