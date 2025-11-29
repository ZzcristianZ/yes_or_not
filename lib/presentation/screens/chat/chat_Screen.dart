// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no/domain/entities/message.dart';
import 'package:yes_or_no/infractructure/models/yes_no_model.dart';
import 'package:yes_or_no/presentation/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/widgets/chat/her_menssage_bubble.dart';
import 'package:yes_or_no/presentation/widgets/chat/my_message_buuble.dart'; 
import 'package:yes_or_no/presentation/widgets/shared/message_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://act-upload.hoyoverse.com/event-ugc-hoyowiki/2024/04/23/10742394/672e65470bfd14b664596c2a7f7eaaf8_8545944417230307859.png?x-oss-process=image%2Fformat%2Cwebp'),
          ),
        ),
        title: Text('Mi cielo'),
        
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final chatProvider= context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {

                  final message = chatProvider.messageList[index];

                  return(message.fromWho == FromWho.hers)
                    ?HerMenssageBubble(message: message)
                    :MyMessageBuuble(message: message);
                },
              )
            ),
            //caja de texto
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value) ),
          ],
        ),
      ),
    );
  }
}