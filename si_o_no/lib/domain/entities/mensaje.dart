enum DeQuien { mio, ella }

class Mensaje {
  final String texto;
  final DeQuien deQuien;
  final String? imagenURL;

  Mensaje({
    required this.texto,
    required this.deQuien,
    required this.imagenURL
  });
}
