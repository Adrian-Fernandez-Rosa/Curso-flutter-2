import 'package:flutter/material.dart';
import 'package:yes_or_no/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message mensajesB;

  const MyMessageBubble({super.key,
  required this.mensajesB});

  @override
  Widget build(BuildContext context) {
    final colores =
        Theme.of(context).colorScheme; // busca los colores del tema actual

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colores.primary, borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              mensajesB.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
