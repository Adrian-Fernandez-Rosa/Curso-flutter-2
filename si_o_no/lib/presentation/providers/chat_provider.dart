import 'package:flutter/material.dart';
import 'package:si_o_no/domain/entities/mensaje.dart';

// ChatProvider:
/// - Extiende de ChangeNotifier -> esto le permite "avisar" a la UI
///   cuando los datos cambian.
/// - Contiene la lista de mensajes.
/// - Tiene funciones para enviar mensajes y actualizar la UI.

class ChatProvider extends ChangeNotifier {
  // Controlando el scroll del chat para mover la vista al final
  final ScrollController scrollchat = ScrollController();

  List<Mensaje> mensajesLista = [
    Mensaje(texto: 'Hola👋', deQuien: DeQuien.mio, imagenURL: null),
    Mensaje(texto: 'Si, donde estas?', deQuien: DeQuien.ella, imagenURL: null),
    Mensaje(texto: 'No te dire', deQuien: DeQuien.mio, imagenURL: null)
  ];

  // Funcion para enviar mensaje mio

  Future<void> enviarMensaje(String texto) async {
    if (texto.isEmpty) return;

    final nuevoMensaje =
        Mensaje(texto: texto, deQuien: DeQuien.mio, imagenURL: null);

    mensajesLista.add(nuevoMensaje);

    // notificamos a los que escuchan
    notifyListeners();
  }

  // Mueve el scroll al ultimo mensaje
  Future<void> moverScrollAlFinal() async {
    await Future.delayed(const Duration(milliseconds: 550));

    scrollchat.animateTo(
      scrollchat.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
      );
  }
}
