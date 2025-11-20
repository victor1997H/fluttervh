import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String nombre = "";
  String usuario = "";
  String correo = "";

  @override
  void initState() {
    super.initState();
    cargarDatosInstantaneos();
    cargarDatosFirestore();
  }

  // 🔥 Carga INSTANTÁNEA desde FirebaseAuth (0.1s)
  void cargarDatosInstantaneos() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        correo = user.email ?? "";
        nombre = "Cargando..."; // se reemplaza después
      });
    }
  }

  // 🔥 Carga REAL desde Firestore con control de tiempo
  Future<void> cargarDatosFirestore() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return;

      final doc = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(uid)
          .get()
          .timeout(const Duration(seconds: 4));

      if (doc.exists) {
        setState(() {
          nombre = doc.data()?['nombre'] ?? "Usuario";
          usuario = doc.data()?['usuario'] ?? "";
          correo = doc.data()?['correo'] ?? correo;
        });
      } else {
        setState(() {
          nombre = "Usuario";
        });
      }
    } catch (e) {
      // Si falla Firestore, la app sigue funcionando
      if (mounted) {
        setState(() {
          if (nombre.isEmpty) nombre = "Usuario";
        });
      }
    }
  }

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
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF2ECC71),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('images/trail.jpg'),
              ),
              accountName: Text(
                nombre.isEmpty ? "Cargando..." : nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(correo),
            ),

            ListTile(
              leading: const Icon(Icons.map_outlined, color: Colors.green),
              title: const Text('Guías'),
              onTap: () {
                Navigator.pushNamed(context, '/guias');
              },
            ),

            ListTile(
              leading: const Icon(Icons.cloud_outlined, color: Colors.green),
              title: const Text('Clima'),
              onTap: () {
                Navigator.pushNamed(context, '/clima');
              },
            ),

            ListTile(
              leading: const Icon(Icons.assignment_turned_in_outlined, color: Colors.green),
              title: const Text('Permisos'),
              onTap: () {
                Navigator.pushNamed(context, '/permisos');
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Cerrar sesión'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_pin, size: 100, color: Color(0xFF2ECC71)),
            const SizedBox(height: 20),
            Text(
              nombre.isEmpty ? "Cargando perfil..." : "Bienvenido, $nombre",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF145A32),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Explora las opciones desde el menú lateral',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
