import 'package:flutter/material.dart';
import 'package:yes_or_no/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  // Mensaje que se muestra en la burbuja
  final Message message;

  // Constructor de la clase
  const HerMessageBubble({super.key, required this.message});

  @override
  // Método que se llama cuando se construye el widget
  Widget build(BuildContext context) {
    // Obtenemos los colores del tema actual
    final colores = Theme.of(context).colorScheme;

    // Devolvemos una columna con la burbuja de mensaje y la imagen
    return Column(
      // Alineamos los elementos de la columna al inicio
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contenedor de la burbuja de mensaje
        Container(
          // Decoración para la burbuja de mensaje
          decoration: BoxDecoration(
            // Color de fondo de la burbuja
            color: colores.secondary,
            // Bordes redondeados para la burbuja
            borderRadius: BorderRadius.circular(20),
          ),
          // Padding para el texto dentro de la burbuja
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              // Texto del mensaje
              message.text,
              // Estilo del texto
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Espacio entre la burbuja de mensaje y la imagen
        const SizedBox(height: 5),

        // Imagen que se muestra debajo de la burbuja de mensaje
        _ImageBubble(message.imageUrl!),

        // Espacio entre la imagen y el siguiente elemento
        const SizedBox(height: 10),
      ],
    );
  }
}
// Clase que representa una imagen en la conversación
class _ImageBubble extends StatelessWidget {
  // URL de la imagen
  final String imageUrl;

  // Constructor de la clase
  const _ImageBubble(this.imageUrl);

  @override
  // Método que se llama cuando se construye el widget
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla
    final resolucion = MediaQuery.of(context).size;

    // Devolvemos una imagen con bordes redondeados
    return ClipRRect(
      // Bordes redondeados para la imagen
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        // URL de la imagen
        imageUrl,
        // Ancho de la imagen
        width: resolucion.width * 0.7,
        // Alto de la imagen
        height: 150,
        // Ajustamos la imagen para que se muestre completa
        fit: BoxFit.cover,
        // Constructor que se llama mientras se carga la imagen
        loadingBuilder: (context, child, loadingProgress) {
          // Si la imagen ya se cargó, devolvemos la imagen
          if (loadingProgress == null) return child;

          // Si la imagen aún se está cargando, devolvemos un indicador de carga
          return Container(
            // Ancho y alto del contenedor
            width: resolucion.width * 0.7,
            height: 150,
            // Padding para el texto de carga
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Center(
              // Texto que se muestra mientras se carga la imagen
              child: Text("Cargando.............."),
            ),
          );
        },
      ),
    );
  }
}