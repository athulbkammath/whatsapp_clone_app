import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSent;

  const MessageBubble({super.key, required this.message, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: isSent ? Colors.teal : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: isSent ? const Radius.circular(16) : Radius.zero,
            topRight: isSent ? Radius.zero : const Radius.circular(16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: isSent ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
