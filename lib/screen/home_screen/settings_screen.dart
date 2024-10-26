import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildAppBar(),
        const Divider(height: 0.3, thickness: 0.4),
        _profileTile(),
        const Divider(height: 0.2, thickness: 0.4),
        _settingsTileView(
            Icons.key, 'Account', 'Security notification, change number'),
        _settingsTileView(Icons.lock_outline, 'Privacy',
            'Black contacts, disappearing messages'),
        _settingsTileView(
            Icons.face_6_sharp, 'Avatar', 'Create, edit, profile photo'),
        _settingsTileView(
            Icons.favorite_border, 'Favourites', 'Add, reorder, remove'),
        _settingsTileView(
            Icons.chat_outlined, 'Chats', 'Theme, wallpapers, chat history'),
        _settingsTileView(Icons.notifications_none, 'Notifications',
            'Message, group & call tones'),
        _settingsTileView(Icons.change_circle_outlined, 'Storage and data',
            'Network usage, auto-download'),
        _settingsTileView(
            Icons.language, 'App language', 'English (device\'s language)'),
        _settingsTileView(Icons.help_outline_outlined, 'Help',
            'Help centre, contact us, privacy policy'),
      ],
    );
  }

  Widget _settingsTileView(IconData icon, String title, String subTitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        subTitle,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }

  ListTile _profileTile() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde"),
        radius: 30,
      ),
      title: const Text(
        'Athul Kammath',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('9856231252'),
          Text('Status message here'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code,
                color: Colors.teal,
                size: 18,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: Colors.teal,
                size: 20,
              ))
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return const ListTile(
      title: Text(
        'Settings',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.search, size: 22, color: Colors.black),
    );
  }
}
