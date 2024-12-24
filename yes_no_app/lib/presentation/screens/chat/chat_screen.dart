import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
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
            backgroundImage: NetworkImage(
                'https://www.faceapp.com/static/img/content/compare/impression-example-after@2x.jpg'),
          ),
        ),
        title: const Text('My love ❤️'),
        // centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

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
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];
                  return (message.fromWho == FromWho.me)
                      ? MyMessageBubble(message: message)
                      : HerMessageBubble(message: message);
                },
              ),
            ),
            // ** TEXT FIELD
            MessageFieldBox(
              onValueChange: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
