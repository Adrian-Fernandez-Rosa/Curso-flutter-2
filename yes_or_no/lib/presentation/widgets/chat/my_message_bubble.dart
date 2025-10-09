import 'package:flutter/material.dart';
import 'package:yes_or_no/domain/entities/message.dart';

// Clase que representa un mensaje del usuario en la conversación
class MyMessageBubble extends StatelessWidget {
  // Mensaje que se muestra en la burbuja
  final Message mensajesB;

  // Constructor de la clase
  const MyMessageBubble({super.key, required this.mensajesB});

  @override
  // Método que se llama cuando se construye el widget
  Widget build(BuildContext context) {
    // Obtenemos los colores del tema actual
    final colores = Theme.of(context).colorScheme;

    // Devolvemos una columna con la burbuja de mensaje
    return Column(
      // Alineamos los elementos de la columna al final (derecha)
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Contenedor de la burbuja de mensaje
        Container(
          // Decoración para la burbuja de mensaje
          decoration: BoxDecoration(
            // Color de fondo de la burbuja (color primario del tema)
            color: colores.primary,
            // Bordes redondeados para la burbuja
            borderRadius: BorderRadius.circular(20),
          ),
          // Padding para el texto dentro de la burbuja
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              // Texto del mensaje
              mensajesB.text,
              // Estilo del texto (color blanco)
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Espacio entre la burbuja de mensaje y el siguiente elemento
        const SizedBox(height: 5)
      ],
    );
  }
}