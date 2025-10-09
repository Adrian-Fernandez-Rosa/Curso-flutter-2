// Importamos la biblioteca de Flutter para crear interfaces de usuario
import 'package:flutter/material.dart';

// Creamos un widget llamado MessageFieldBox que permite enviar mensajes
class MessageFieldBox extends StatelessWidget {
  // Esta función se llama cuando el usuario envía un mensaje
  final ValueChanged<String> onValue;

  // Constructor del widget
  const MessageFieldBox({super.key, required this.onValue});

  @override
  // Método que se llama cuando se construye el widget
  Widget build(BuildContext context) {
    // Creamos un controlador de texto para obtener el texto que escribe el usuario
    final textController = TextEditingController();

    // Creamos un nodo de enfoque para manejar el foco del campo de texto
    final focusNode = FocusNode();

    // Creamos un borde para el campo de texto
    final OutlineInputBorder = UnderlineInputBorder(
      // No queremos que se vea el borde inferior
      borderSide: const BorderSide(color: Colors.transparent),
      // Queremos que el borde sea redondeado
      borderRadius: BorderRadius.circular(40),
    );

    // Creamos la decoración para el campo de texto
    final InputDecorationd = InputDecoration(
      // Texto que se muestra cuando el campo de texto está vacío
      hintText: 'Envia tu mensaje como pregunta ??',
      // Borde que se muestra cuando el campo de texto no está enfocado
      enabledBorder: OutlineInputBorder,
      // Borde que se muestra cuando el campo de texto está enfocado
      focusedBorder: OutlineInputBorder,
      // Queremos que el campo de texto tenga un fondo
      filled: true,
      // Icono que se muestra al final del campo de texto
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        // Función que se llama cuando se presiona el icono de enviar
        onPressed: () {
          // Obtenemos el texto que escribió el usuario
          final textValue = textController.value.text;
          // Limpiamos el campo de texto
          textController.clear();
          // Llamamos a la función onValue con el texto del usuario
          onValue(textValue);
        },
      ),
    );

    // Devolvemos el campo de texto
    return TextFormField(
      // Función que se llama cuando el usuario toca fuera del campo de texto
      onTapOutside: (event) {
        // Quitamos el foco del campo de texto
        focusNode.unfocus();
      },
      // Nodo de enfoque para el campo de texto
      focusNode: focusNode,
      // Controlador de texto para obtener el texto del usuario
      controller: textController,
      // Decoración para el campo de texto
      decoration: InputDecorationd,
      // Función que se llama cuando el usuario envía el formulario
      onFieldSubmitted: (value) {
        // Imprimimos el valor enviado
        print("submit value $value");
        // Limpiamos el campo de texto
        textController.clear();
        // Pedimos el foco para el campo de texto de nuevo
        focusNode.requestFocus();
        // Llamamos a la función onValue con el texto del usuario
        onValue(value);
      },
      // Función que se llama cuando el texto del campo de texto cambia
      onChanged: (value) {
        // Imprimimos el valor cambiado
        print('changed: $value');
      },
    );
  }
}