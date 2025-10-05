import 'package:flutter/material.dart';
import 'package:yes_or_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_or_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_or_no/presentation/widgets/shared/message_field_box.dart';

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
                'https://images.vexels.com/media/users/3/148908/isolated/lists/14f4623e9f7c743bd93a3bfdfbc857bb-mapa-de-la-region-de-piamonte.png'),
          ),
        ),
        title: const Text("MIIIImimi mimi mi"),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0) 
                ? const MyMessageBubble() 
                : const HerMessageBubble();
              },
            )),
            // Caja de texto de mensajes
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
