import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_o_no/main.dart';
import 'package:si_o_no/presentation/providers/chat_provider.dart';

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
          title: const Text("Laura"),
          centerTitle: false,
        ),
        body: const _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    // SafeArea evita que el contenido se esconda detrás de la barra de estado o el notch
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // Lista de mensajes
          Expanded(
              child: ListView.builder(
            controller: chatProvider.scrollchat,
            itemCount: chatProvider.mensajesLista.length,
            itemBuilder: (context, index) {
              final mensaje = chatProvider.mensajesLista[index];
              return Text(mensaje.texto);
            },
          )),
          // caja de texto 2
          Container(
            color: Colors.grey[200],
            height: 50,
            child: const Center(
              child: Text("Aqui va la caja de texto"),
            ),
          )
        ],
      ),
    ));
  }
}
