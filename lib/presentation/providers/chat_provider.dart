import 'package:flutter/material.dart';
import 'package:yes_no_app_pablo_soberanis/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList=[
    Message(text: "Hola Pablo", fromWho: FromWho.me),
    Message(text: "¿Hoy gana Vini el balon de oro?", fromWho: FromWho.me),
  ];
  //Controlador para manejar la posicion del scroll
  final ScrollController chatScrollControler = ScrollController();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser mi porque yo lo envio 
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a lista "messageList"
    messageList.add(newMessage);
    //Notifica si algo de provider cambio para que se guarde el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
}
    //Mover el scroll al ultimo mensaje
    Future<void> moveScrollToBottom() async{
      //Delay en la animacion para garantizar que siempre se vera aun cuando se envien mensaje cortos y rapidos
      await Future.delayed(const Duration(seconds: 1));
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