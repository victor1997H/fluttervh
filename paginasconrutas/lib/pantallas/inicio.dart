import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aventura360'),
        backgroundColor: const Color(0xFF2ECC71),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Encabezado con fondo verde e imagen
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF2ECC71),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('images/trail.jpg'),
              ),
              accountName: const Text(
                'Usuario Aventura',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text('usuario@aventura360.com'),
            ),

            // Pestaña Guías
            ListTile(
              leading: const Icon(Icons.map_outlined, color: Colors.green),
              title: const Text('Guías'),
              onTap: () {
                Navigator.pushNamed(context, '/guias');
              },
            ),

            // Pestaña Clima
            ListTile(
              leading: const Icon(Icons.cloud_outlined, color: Colors.green),
              title: const Text('Clima'),
              onTap: () {
                Navigator.pushNamed(context, '/clima');
              },
            ),

            // Pestaña Permisos
            ListTile(
              leading: const Icon(Icons.assignment_turned_in_outlined, color: Colors.green),
              title: const Text('Permisos'),
              onTap: () {
                Navigator.pushNamed(context, '/permisos');
              },
            ),

            const Divider(),

            // Cerrar sesión
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
          ],
        ),
      ),

      // Cuerpo principal de la pantalla de inicio
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.person_pin, size: 100, color: Color(0xFF2ECC71)),
            SizedBox(height: 20),
            Text(
              'Bienvenido a tu perfil',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF145A32),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Explora las opciones desde el menú lateral',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
