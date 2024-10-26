import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_app/provider/chat_provider.dart';
import 'package:whatsapp_clone_app/provider/home_provider.dart';
import 'chat_list_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Selector<HomeProvider, int>(
      selector: (_, provider) => provider.tabCount,
      builder: (_, tabCount, child) => Selector<HomeProvider, int>(
        selector: (_, provider) => provider.selectedIndex,
        builder: (_, selectedIndex, child) => Scaffold(
          body: _tabBody(selectedIndex),
          bottomNavigationBar: _bottomNavigationBar(tabCount, selectedIndex),
          floatingActionButton: Selector<HomeProvider, int>(
              selector: (_, provider) => provider.selectedIndex,
              builder: (_, selectedIndex, child) {
                return _floatingActionButton(selectedIndex);
              }),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(int tabCount, int selectedIndex) {
    return BottomNavigationBar(
      items: [
        for (int tab = 1; tab <= tabCount; tab++) _bottomNavigationView(tab)
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        Provider.of<HomeProvider>(context, listen: false).setIndex(index);
      },
      type: BottomNavigationBarType.fixed,
    );
  }

  BottomNavigationBarItem _bottomNavigationView(int tab) {
    switch (tab) {
      case 2:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.call), label: 'Calls');
      case 3:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera), label: 'Status');
      case 4:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Settings');
      case 1:
      default:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.chat), label: 'Chats');
    }
  }

  Widget _tabBody(int index) {
    switch (index) {
      case 0:
        return ChangeNotifierProvider(
            create: (_) => ChatProvider(), child: const ChatListScreen());
      case 3:
        return const SettingsScreen();
      case 1:
      case 2:
      default:
        return const Center(child: Text('Coming Soon'));
    }
  }

  Widget _floatingActionButton(int index) {
    switch (index) {
      case 0:
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.teal,
          child: const Icon(Icons.chat, color: Colors.white),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
