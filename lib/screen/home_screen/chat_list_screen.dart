import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/chat_provider.dart';
import 'chat_list_tile.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatProvider>(context, listen: false).loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, _) {
          return ListView.builder(
            itemCount: chatProvider.users.length,
            itemBuilder: (ctx, i) => ChatListTile(
              user: chatProvider.users[i],
              hasNewMessages: i % 2 == 0,
            ),
          );
        },
      ),
    );
  }
}
