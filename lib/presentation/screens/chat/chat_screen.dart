import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder:(context, index) {
                return ( index % 2 == 0 )
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
              })),

            //Caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}