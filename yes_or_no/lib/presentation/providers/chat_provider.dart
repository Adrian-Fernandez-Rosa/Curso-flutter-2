// Importaciones necesarias para la clase ChatProvider
import 'package:flutter/material.dart';
import 'package:yes_or_no/config/helpers/get_yes_no_answer.dart';
import 'package:yes_or_no/domain/entities/message.dart';

// Clase que gestiona el estado de la conversación
class ChatProvider extends ChangeNotifier {
  // Controlador de scroll para la lista de mensajes
  final ScrollController chatscrollController = ScrollController();

  // Instancia de GetYesNoAnswer para obtener respuestas de "sí" o "no"
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  // Lista de mensajes que se muestra en la conversación
  List<Message> mensajesLista = [
    // Mensajes iniciales de la conversación
    Message(text: 'Holus bolus', fromWho: FromWho.mio),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mio)
  ];

  // Método que se llama cuando se necesita obtener una respuesta de "sí" o "no"
  Future<void> herReply() async {
    // Obtiene una respuesta de "sí" o "no" utilizando la clase GetYesNoAnswer
    final herMessage = await getYesNoAnswer.getAnswer();

    // Agrega la respuesta a la lista de mensajes
    mensajesLista.add(herMessage);

    // Notifica a los widgets que dependen de este proveedor que el estado ha cambiado
    notifyListeners();

    // Mueve el scroll al final de la lista de mensajes
    moveScrollToBottom();
  }

  // Método que se llama cuando se envía un mensaje
  Future<void> enviarMensaje(String text) async {
    // Verifica si el texto del mensaje está vacío y, si es así, no hace nada
    if (text.isEmpty) return;

    // Verifica si el texto del mensaje termina con un signo de interrogación
    if (text.endsWith('?')) {
      // Si es así, llama al método herReply() para obtener una respuesta de "sí" o "no"
      herReply();
    }

    // Crea un nuevo mensaje con el texto y el remitente
    final newMessage = Message(text: text, fromWho: FromWho.mio);

    // Agrega el mensaje a la lista de mensajes
    mensajesLista.add(newMessage);

    // Notifica a los widgets que dependen de este proveedor que el estado ha cambiado
    // En lugar de setState, se utiliza notifyListeners() para actualizar la interfaz de usuario
    notifyListeners();

    // Mueve el scroll al final de la lista de mensajes
    moveScrollToBottom();
  }

  // Método que mueve el scroll al final de la lista de mensajes
  Future<void> moveScrollToBottom() async {
    // Espera un breve período de tiempo antes de mover el scroll
    await Future.delayed(const Duration(milliseconds: 150));

    // Mueve el scroll al final de la lista de mensajes con una animación
    chatscrollController.animateTo(
      // Posición final del scroll
      chatscrollController.position.maxScrollExtent,
      // Duración de la animación
      duration: const Duration(milliseconds: 300),
      // Curva de animación
      curve: Curves.easeOut
    );
  }
}