import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class UbicacionPage extends StatelessWidget {
  final String lugar;
  const UbicacionPage({super.key, required this.lugar});

  // Coordenadas aproximadas de los lugares
  LatLng _coordenadasLugar(String lugar) {
    switch (lugar) {
      case 'Rucu Pichincha':
        return LatLng(-0.1703, -78.5963);
      case 'Mindo':
        return LatLng(-0.0560, -78.7767);
      case 'Quilotoa':
        return LatLng(-0.8323, -78.9014);
      case 'Baños de Agua Santa':
        return LatLng(-1.3967, -78.4233);
      default:
        return LatLng(-0.1807, -78.4678); // Quito
    }
  }

  @override
  Widget build(BuildContext context) {
    final ubicacion = _coordenadasLugar(lugar);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación - $lugar'),
        backgroundColor: Colors.green.shade700,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: ubicacion,
          initialZoom: 12,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.aventura360',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: ubicacion,
                width: 60,
                height: 60,
                child: const Icon(
                  Icons.location_on,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
