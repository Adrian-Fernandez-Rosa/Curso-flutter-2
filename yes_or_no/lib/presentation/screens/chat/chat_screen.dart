import 'package:flutter/material.dart';
import 'package:yes_or_no/domain/entities/message.dart';
import 'package:yes_or_no/main.dart';
import 'package:yes_or_no/presentation/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_or_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_or_no/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
          ),
        ),
        title: const Text("Laura no esta"),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatscrollController,
              itemCount: chatProvider.mensajesLista.length,
              itemBuilder: (context, index) {
                final message = chatProvider.mensajesLista[index];

                return (message.fromWho == FromWho.ella)
                    ?  HerMessageBubble(message : message)
                    : MyMessageBubble(mensajesB: message);
              },
            )),
            // Caja de texto de mensajes
            MessageFieldBox(
           //   onValue: (value) => chatProvider.enviarMensaje(value), esto es igual a:
            onValue: chatProvider.enviarMensaje,
            )
          ],
        ),
      ),
    );
  }
}
