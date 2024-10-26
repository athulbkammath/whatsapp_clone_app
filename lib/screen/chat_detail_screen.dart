import 'package:flutter/material.dart';
import '../model/user.dart';
import '../widget/message_bubble.dart';

class ChatDetailScreen extends StatelessWidget {
  final User user;

  const ChatDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                MessageBubble(message: "Hello!", isSent: true),
                MessageBubble(message: "Hi, how are you?", isSent: false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon:
                    IconButton(icon: const Icon(Icons.send), onPressed: () {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
