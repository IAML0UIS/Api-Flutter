// lib/cita.dart
class Cita {
  final String fecha;
  final String hora;
  final String descripcion;
  final String lugar;

  Cita(
      {required this.fecha,
      required this.hora,
      required this.descripcion,
      required this.lugar});

  factory Cita.fromJson(Map<String, dynamic> json) {
    return Cita(
      fecha: json['fecha'],
      hora: json['hora'],
      descripcion: json['descripcion'],
      lugar: json['lugar'],
    );
  }
}
