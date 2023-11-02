import 'package:flutter/material.dart';
import 'package:mi_chat/config/helper/get_yes_no_answer.dart';
import 'package:mi_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final getYesNoAsnwer = GetYesNoAnswer();

  final chatScrollController = ScrollController();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
      if(text.isEmpty) return;

      final newMessage = Message(text: text, fromWho: FromWho.me);
      messageList.add(newMessage);

      if(text.endsWith('?')){
        herReply();
      }

      notifyListeners();
      moveScrollToBottom();
  }

  Future<void> herReply() async{
    final herMessage = await getYesNoAsnwer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom()async{

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }

}