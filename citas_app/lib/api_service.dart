// lib/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cita.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:5000';

  Future<List<Cita>> fetchCitas() async {
    final response = await http.get(Uri.parse('$baseUrl/citas'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((cita) => Cita.fromJson(cita)).toList();
    } else {
      throw Exception('Error al cargar las citas');
    }
  }
}
