import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_chat/domain/entities/message.dart';


class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat.jm().format(now);
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(message.text, style: const TextStyle(color: Colors.black)),
                Text(formattedTime, style: const TextStyle(fontSize: 10, color: Colors.black))
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}


