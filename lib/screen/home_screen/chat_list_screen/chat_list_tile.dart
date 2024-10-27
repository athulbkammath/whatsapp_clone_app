import 'package:flutter/material.dart';
import '../../../model/user.dart';
import '../../chat_detail_screen.dart';

class ChatListTile extends StatelessWidget {
  final User user;
  final bool hasNewMessages;

  const ChatListTile(
      {super.key, required this.user, this.hasNewMessages = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.imageUrl),
          radius: 25,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "12:45",
              style: TextStyle(
                  color: hasNewMessages ? Colors.teal : Colors.grey,
                  fontSize: 12),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(user.lastMessage, overflow: TextOverflow.ellipsis),
            if (hasNewMessages)
              const Padding(
                padding: EdgeInsets.only(top: 1),
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 8,
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => ChatDetailScreen(user: user)),
        ),
      ),
    );
  }
}
