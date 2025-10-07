import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // final colores = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    // ignore: non_constant_identifier_names
    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    // ignore: non_constant_identifier_names
    final InputDecorationd = InputDecoration(
      hintText: 'Envia tu mensaje como pregunta ??',
      enabledBorder: OutlineInputBorder,
      focusedBorder: OutlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          // print('Boton $textValue');
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecorationd,
      onFieldSubmitted: (value) {
        print("submit value $value");
        textController.clear(); // Limpia lo que escribio
        focusNode
            .requestFocus(); // no se notan cambios, se supone que conserva el foco
        onValue(value);
      },
      onChanged: (value) {
        print('changed: $value');
      },
    );
  }
}
