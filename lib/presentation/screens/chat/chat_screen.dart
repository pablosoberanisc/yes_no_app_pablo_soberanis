import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/736x/d1/af/9f/d1af9f521560d37768640462446a12c6.jpg'),
          ),
        ),
        title: const Text("Leo Messi"),
        centerTitle: false,
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
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollControler,
                itemCount: chatProvider.messageList.length,
                itemBuilder:(context, index) {
                  final message = chatProvider.messageList[index];

                  return ( message.fromWho == FromWho.hers)
                    ? HerMessageBubble( message: message)
                    : MyMessageBubble( message: message,);
              })),

            //Caja de texto de mensajes
            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}