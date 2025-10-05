import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final colores = Theme.of(context).colorScheme; // busca los colores del tema actual

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [Container(
        decoration: BoxDecoration(
          color: colores.primary,
          borderRadius: BorderRadius.circular(20)
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("Laboris duis dolore", style: TextStyle(color: Colors.white),),
        ),
      ),
      const SizedBox(height: 10)
      ],
    );
  }
}
