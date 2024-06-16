// lib/main.dart
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'cita.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CitasScreen(),
    );
  }
}

class CitasScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citas'),
      ),
      body: Center(
        child: FutureBuilder<List<Cita>>(
          future: apiService.fetchCitas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No hay citas disponibles');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Cita cita = snapshot.data![index];
                  return ListTile(
                    title: Text('Fecha: ${cita.fecha}, Hora: ${cita.hora}'),
                    subtitle: Text(
                        'Descripción: ${cita.descripcion}, Lugar: ${cita.lugar}'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
