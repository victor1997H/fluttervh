import 'package:flutter/material.dart';
import 'package:paginasconrutas/pantallas/ubicacion.dart'; // 🟢 agregado

class ClimaPage extends StatelessWidget {
  const ClimaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> climas = [
      {
        'lugar': 'Rucu Pichincha',
        'temperatura': '9°C',
        'sensacion': '7°C',
        'viento': '15 km/h',
        'humedad': '80%',
        'descripcion': 'Nublado con ráfagas de viento. Ideal para caminatas tempranas.',
        'icono': Icons.cloud,
        'color': const Color(0xFF5DADE2),
        'imagen': 'images/rucu.jpg',
      },
      {
        'lugar': 'Mindo',
        'temperatura': '22°C',
        'sensacion': '23°C',
        'viento': '10 km/h',
        'humedad': '70%',
        'descripcion': 'Parcialmente soleado, clima perfecto para avistamiento de aves.',
        'icono': Icons.wb_sunny,
        'color': const Color(0xFFF5B041),
        'imagen': 'images/mindo.jpg',
      },
      {
        'lugar': 'Quilotoa',
        'temperatura': '11°C',
        'sensacion': '9°C',
        'viento': '20 km/h',
        'humedad': '65%',
        'descripcion': 'Fresco y despejado. Visibilidad total del cráter.',
        'icono': Icons.ac_unit,
        'color': const Color(0xFF85C1E9),
        'imagen': 'images/quilotoa.jpg',
      },
      {
        'lugar': 'Baños de Agua Santa',
        'temperatura': '18°C',
        'sensacion': '19°C',
        'viento': '12 km/h',
        'humedad': '75%',
        'descripcion': 'Cálido con ligera llovizna. Ideal para termales y cascadas.',
        'icono': Icons.grain,
        'color': const Color(0xFF58D68D),
        'imagen': 'images/baños.jpg',
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Clima Aventura360',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2ECC71), Color(0xFFEFF7EF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          itemCount: climas.length,
          itemBuilder: (context, index) {
            final clima = climas[index];
            return GestureDetector( // 🟢 agregado
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UbicacionPage(lugar: clima['lugar']), // 🟢 agregado
                  ),
                );
              },
              child: _buildClimaCard(clima),
            );
          },
        ),
      ),
    );
  }

  Widget _buildClimaCard(Map<String, dynamic> clima) {
    return Card(
      elevation: 10,
      shadowColor: clima['color'].withOpacity(0.4),
      margin: const EdgeInsets.only(bottom: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          // Imagen de fondo con opacidad
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              clima['imagen'],
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.35), // Opacidad para contraste
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Contenido del clima encima de la imagen
          Container(
            height: 220,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [clima['color'].withOpacity(0.25), Colors.transparent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lugar e icono del clima
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      clima['lugar'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      clima['icono'],
                      color: Colors.white,
                      size: 45,
                    ),
                  ],
                ),
                const Spacer(),

                // Temperatura y sensación
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '🌡️ ${clima['temperatura']}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sensación: ${clima['sensacion']}',
                      style: const TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Viento y humedad
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '💨 Viento: ${clima['viento']}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Text(
                      '💧 Humedad: ${clima['humedad']}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Descripción
                Text(
                  clima['descripcion'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
