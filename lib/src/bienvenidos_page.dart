import 'package:flutter/material.dart';

class BienvenidosPage extends StatelessWidget {
  const BienvenidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenidos'),
        backgroundColor: const Color.fromARGB(255, 23, 194, 128),
      ),
      body: const Center(
        child: Text(
          'BIENVENIDOS',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
    );
  }
}
