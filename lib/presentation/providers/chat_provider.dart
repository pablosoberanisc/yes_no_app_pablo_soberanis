import 'package:flutter/material.dart';
import 'package:yes_no_app_pablo_soberanis/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  //Controlador para manejar la posicion del scroll
  final chatScrollControler = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
  Message(text: 'Hola Messi', fromWho: FromWho.me, timestamp: DateTime.now()),
    Message(
        text: 'Soy tu fan',
        fromWho: FromWho.me,
        timestamp: DateTime.now()), // Asegúrate de añadir esto
  
];
  

  // Enviar un mensaje
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    //El mensaje siempre va a ser mi porque yo lo envio 
   final newMessage= Message(text: text, fromWho: FromWho.me,timestamp: DateTime.now(),);
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
   // print("Cantidad de mensajes en la lista: ${messageList.length}");

    if ( text.endsWith('?')){
      herReply();
    }

    //Notifica si algo de provider cambio para que se guarde el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
}

// En Javascript el equivalente a future es promesa
    Future<void> herReply() async{
      final herMessage = await getYesNoAnswer.getAnswer();
      messageList.add(herMessage);
      notifyListeners();

      moveScrollToBottom();
      
    }

    //Mover el scroll al ultimo mensaje
    Future<void> moveScrollToBottom() async{
      //Delay en la animacion para garantizar que siempre se vera aun cuando se envien mensaje cortos y rapidos
      await Future.delayed(const Duration(milliseconds: 100));
      chatScrollControler.animateTo(
        //offset: posicion de la animacion
        //maxScrollExtent: determina lo maximo que el scroll puede dar
        chatScrollControler.position.maxScrollExtent,
        //Duracion de la animacion
        duration: const Duration(milliseconds: 300),
        //"Rebote" al final de la animacion
        curve: Curves.easeOut);
    
  }
}