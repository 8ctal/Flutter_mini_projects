import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(fromWho: FromWho.me, text: 'Hey babe'),
    Message(fromWho: FromWho.me, text: 'U arrived from work?')
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(fromWho: FromWho.me, text: text);
    messagesList.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    scrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getYesNoAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    scrollToBottom();
  }

  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
