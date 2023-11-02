import 'package:flutter/material.dart';
import 'package:mi_chat/domain/entities/message.dart';
import 'package:mi_chat/presentation/providers/chat_provider.dart';
import 'package:mi_chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:mi_chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:mi_chat/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://static.wikia.nocookie.net/doblaje/images/7/7b/Adam_sandler.jpg/revision/latest?cb=20230410010609&path-prefix=es"),
          ),
        ),
        title: const Text("Hola"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
             Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.your)
                          ?HerMessageBubble(message: message,)
                          :MyMessageBubble(message: message,);
                },
              )
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}