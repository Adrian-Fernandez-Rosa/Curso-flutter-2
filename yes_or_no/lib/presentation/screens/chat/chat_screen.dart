import 'package:flutter/material.dart';
import 'package:yes_or_no/domain/entities/message.dart';

import 'package:yes_or_no/presentation/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_or_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_or_no/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';
// Clase que define la pantalla de chat
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Devuelve un Scaffold con una barra de aplicaciones y un cuerpo
    return Scaffold(
      appBar: AppBar(
        // Agrega un padding al icono de la barra de aplicaciones
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            // Establece la imagen de perfil
            backgroundImage: NetworkImage(
                'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
          ),
        ),
        // Establece el título de la barra de aplicaciones
        title: const Text("Laura no esta"),
        // No centra el título
        centerTitle: false,
      ),
      // Establece el cuerpo de la pantalla
      body: _ChatView(),
    );
  }
}

// Clase que define el contenido de la pantalla de chat
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene una instancia del proveedor de estado ChatProvider
    final chatProvider = context.watch<ChatProvider>();

    // Devuelve un SafeArea que evita que los widgets se superpongan con la barra de estado
    return SafeArea(
      child: Padding(
        // Agrega un padding al contenido
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Crea un ListView que muestra los mensajes
            Expanded(
              child: ListView.builder(
                // Establece el controlador de scroll
                controller: chatProvider.chatscrollController,
                // Establece el número de elementos en la lista
                itemCount: chatProvider.mensajesLista.length,
                // Define un constructor de elementos para la lista
                itemBuilder: (context, index) {
                  // Obtiene el mensaje en la posición actual
                  final message = chatProvider.mensajesLista[index];

                  // Muestra un mensaje como un HerMessageBubble o un MyMessageBubble, dependiendo de quién envió el mensaje
                  return (message.fromWho == FromWho.ella)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(mensajesB: message);
                },
              ),
            ),
            // Crea un campo de texto para enviar mensajes
            MessageFieldBox(
              // Establece la función que se llama cuando se envía un mensaje
              onValue: chatProvider.enviarMensaje,
            )
          ],
        ),
      ),
    );
  }
}