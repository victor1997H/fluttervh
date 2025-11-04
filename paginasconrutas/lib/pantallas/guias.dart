import 'package:flutter/material.dart';

class GuiasPage extends StatelessWidget {
  const GuiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> guias = [
      {
        'nombre': 'Carlos Rivera',
        'experiencia': '5 años de experiencia en rutas de montaña.',
        'imagen': 'images/guia1.jpg',
        'rating': 4.9,
      },
      {
        'nombre': 'Lucía Torres',
        'experiencia': 'Especialista en turismo ecológico y aventura.',
        'imagen': 'images/guia2.jpg',
        'rating': 4.8,
      },
      {
        'nombre': 'Andrés Paredes',
        'experiencia': 'Guía certificado en recorridos extremos y rafting.',
        'imagen': 'images/guia3.jpg',
        'rating': 5.0,
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Nuestros Guías',
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
          itemCount: guias.length,
          itemBuilder: (context, index) {
            final guia = guias[index];
            return _buildGuiaCard(guia);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF2ECC71),
        onPressed: () {},
        icon: const Icon(Icons.chat_bubble_outline),
        label: const Text('Contactar Guía'),
      ),
    );
  }

  Widget _buildGuiaCard(Map<String, dynamic> guia) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(bottom: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.green.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen circular centrada
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: const Color(0xFF2ECC71), width: 3),
                image: DecorationImage(
                  image: AssetImage(guia['imagen']),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Nombre del guía
            Text(
              guia['nombre'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF145A32),
              ),
            ),

            const SizedBox(height: 8),

            // Experiencia
            Text(
              guia['experiencia'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),

            const SizedBox(height: 10),

            // Calificación (estrellas)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  guia['rating'].floor(),
                  (index) => const Icon(Icons.star, color: Colors.amber, size: 22),
                ),
                if (guia['rating'] % 1 != 0)
                  const Icon(Icons.star_half, color: Colors.amber, size: 22),
                const SizedBox(width: 6),
                Text(
                  guia['rating'].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
