import 'package:flutter/material.dart';
import 'package:yes_or_no/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colores =
        Theme.of(context).colorScheme; // busca los colores del tema actual

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colores.secondary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        // ignore: prefer_const_constructors
        _ImageBubble(message.imageUrl!),

        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  // ignore: unused_element
  const _ImageBubble(this.imageUrl);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final resolucion = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: resolucion.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: resolucion.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Center(child: Text("Cargando..............")),
            );
          },
        ));
  }
}
