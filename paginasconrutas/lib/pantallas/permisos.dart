import 'package:flutter/material.dart';

class PermisosPage extends StatelessWidget {
  const PermisosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> permisos = [
      {
        'lugar': 'Rucu Pichincha',
        'descripcion':
            'Para ingresar al Rucu Pichincha no se requiere permiso especial, pero se recomienda registrarse en el control militar del Teleférico por seguridad. Es obligatorio llevar documento de identidad y respetar los horarios de ingreso (7:00 a 15:00).',
        'requisitos': [
          'Documento de identidad (obligatorio)',
          'Registro en control de seguridad',
          'Ropa térmica y calzado adecuado',
        ],
        'contacto': 'Control Militar del Teleférico - Quito',
        'imagen': 'images/rucu.jpg',
        'color': const Color(0xFF5DADE2),
      },
      {
        'lugar': 'Mindo',
        'descripcion':
            'Mindo no requiere permisos oficiales, pero algunas reservas naturales o cascadas solicitan una entrada local. Puedes adquirirla en el sitio o en la oficina de turismo del pueblo.',
        'requisitos': [
          'Entrada a reservas privadas (si aplica)',
          'Pago en efectivo (entre \$2 y \$5 por persona)',
          'Respetar áreas de conservación ecológica',
        ],
        'contacto': 'Oficina de Turismo de Mindo - +593 2 217 0021',
        'imagen': 'images/mindo.jpg',
        'color': const Color(0xFFF5B041),
      },
      {
        'lugar': 'Quilotoa',
        'descripcion':
            'El ingreso al mirador y sendero del Quilotoa requiere un permiso comunitario que se paga en la entrada al pueblo. El valor ayuda a mantener el sendero y servicios turísticos.',
        'requisitos': [
          'Permiso comunitario (\$2 por persona)',
          'Cumplir normas de seguridad del sendero',
          'No acampar sin autorización previa',
        ],
        'contacto': 'Comunidad de Quilotoa - Cotopaxi',
        'imagen': 'images/quilotoa.jpg',
        'color': const Color(0xFF85C1E9),
      },
      {
        'lugar': 'Baños de Agua Santa',
        'descripcion':
            'Baños no requiere permisos generales, pero ciertas actividades como canopy, puenting o acceso a cascadas específicas requieren autorización o pago de entrada local.',
        'requisitos': [
          'Permiso para deportes extremos (otorgado por operadores locales)',
          'Pago de ingreso a cascadas (entre \$1 y \$3)',
          'Uso de casco y chaleco obligatorio en actividades',
        ],
        'contacto': 'Dirección de Turismo de Baños - +593 3 274 0416',
        'imagen': 'images/baños.jpg',
        'color': const Color(0xFF58D68D),
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Permisos y Requisitos',
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
          itemCount: permisos.length,
          itemBuilder: (context, index) {
            final permiso = permisos[index];
            return _buildPermisoCard(permiso);
          },
        ),
      ),
    );
  }

  Widget _buildPermisoCard(Map<String, dynamic> permiso) {
    return Card(
      elevation: 10,
      shadowColor: permiso['color'].withOpacity(0.4),
      margin: const EdgeInsets.only(bottom: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias, // ✅ bordes suaves
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // Imagen con opacidad y efecto oscuro
          Image.asset(
            permiso['imagen'],
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.35),
            colorBlendMode: BlendMode.darken,
          ),

          // Contenido encima de la imagen
          Container(
            padding: const EdgeInsets.all(20),
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  permiso['lugar'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    permiso['descripcion'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Requisitos:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                ...permiso['requisitos'].map<Widget>((req) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '• $req',
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 8),
                Text(
                  '📍 ${permiso['contacto']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 13,
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
