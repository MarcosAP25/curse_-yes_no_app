import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_form_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.fhex5-1.fna.fbcdn.net/v/t39.30808-6/429893243_1732125143948089_8443473600314963779_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHNJU5FbXB8vp-qiXwKeCsOuEvGbMlD4wu4S8ZsyUPjC6BfiSWRqV9K7mXNi4tdorT95lK5JbCeFDwY-JWJZsg0&_nc_ohc=zhfDnhJsqHwQ7kNvwFOVgCb&_nc_oc=Adl81SnvaqhZXhlnDVHpc-NitbPLMrQ0P_L_sNtZyw5V4nKZP8H2nGZtLwegiWykye0&_nc_zt=23&_nc_ht=scontent.fhex5-1.fna&_nc_gid=57SWGIdoQlyZ0j0K4D7QYQ&oh=00_AfOKqZNyRSxnIxkq3fE83S-P7yqW8UhG-9A6Xp7Mdx7vYw&oe=6854E017'),
          ),
        ),
        title: const Text('Chichi ❤️'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final messages = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.messageList.length,
                itemBuilder: (context, index) {
                  final message = messages.messageList[index];
                 return (message.fromWho == FromWho.hers)
                  ? HerMessageBubble()
                  : MyMessageBubble(
                    message: message,
                  );
                },
              ),
            ),
            MessageFormField()
          ],
        ),
      )
    );
  }
}