import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_pablo_soberanis/presentation/widgets/shared/message_field_box.dart';

//https://i.pinimg.com/736x/d1/af/9f/d1af9f521560d37768640462446a12c6.jpg

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  leading: const Padding(
    padding: EdgeInsets.all(5.0),
    child: CircleAvatar(
      backgroundImage: NetworkImage('https://i.pinimg.com/736x/d1/af/9f/d1af9f521560d37768640462446a12c6.jpg'),
    ),
  ),
  title: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Text('Messi'),
       SizedBox(height: 5),
       Text(
        'En línea',
        style: TextStyle(fontSize: 12, color: Colors.green),
      ),
         ],
  ),
  
),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    print('Cantidad de mensajes: ${chatProvider.messageList.length}');

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollControler,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      // Instancia del message qy¿ue sabra de quien es el mensaje
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(
                              message: message,
                            )
                          : MyMessageBubble(
                              message: message,
                            );
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