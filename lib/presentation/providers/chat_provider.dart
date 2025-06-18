
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = <Message>[
    Message(message: 'Hola amor!', fromWho: FromWho.mine),
    Message(message: 'Ya regresaste del trabajo?', fromWho: FromWho.mine),
  ];


  Future<void> sendMessage(String message) async {
    //TODO: Implementar metodo
  } 
}