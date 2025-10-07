import 'package:flutter/material.dart';
import 'package:yes_or_no/config/helpers/get_yes_no_answer.dart';
import 'package:yes_or_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatscrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> mensajesLista = [
    Message(text: 'Holus bolus', fromWho: FromWho.mio),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mio)
  ];

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    mensajesLista.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> enviarMensaje(String text) async {
    if (text.isEmpty) return;

    if (text.endsWith('?')) {
      herReply();
    }
    final newMessage = Message(text: text, fromWho: FromWho.mio);
    mensajesLista.add(newMessage);

    // en lugar de setState ahora sera
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 150));
    chatscrollController.animateTo(
        chatscrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
