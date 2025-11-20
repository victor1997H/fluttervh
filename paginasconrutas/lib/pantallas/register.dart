import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController();
    final usuarioController = TextEditingController();
    final correoController = TextEditingController();
    final contrasenaController = TextEditingController();
    final confirmarController = TextEditingController();

    Future<void> registrarUsuario() async {
      final nombre = nombreController.text.trim();
      final usuario = usuarioController.text.trim();
      final correo = correoController.text.trim();
      final contrasena = contrasenaController.text.trim();
      final confirmar = confirmarController.text.trim();

      if (nombre.isEmpty ||
          usuario.isEmpty ||
          correo.isEmpty ||
          contrasena.isEmpty ||
          confirmar.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Completa todos los campos")),
        );
        return;
      }

      if (contrasena != confirmar) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Las contraseñas no coinciden")),
        );
        return;
      }

      try {
        // Crear usuario en Firebase Auth
        UserCredential cred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: correo, password: contrasena);

        // Guardar datos adicionales en Firestore
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(cred.user!.uid)
            .set({
          'nombre': nombre,
          'usuario': usuario,
          'correo': correo,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario registrado correctamente'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushNamed(context, '/');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEFF7EF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Encabezado igual al login
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF2ECC71),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/trail.jpg'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Aventura360',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                'REGISTRARSE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF145A32),
                ),
              ),
              const SizedBox(height: 20),

              // Campo Nombre completo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.badge_outlined),
                    labelText: 'Nombre completo',
                    filled: true,
                    fillColor: const Color(0xFFF0F8F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Campo Usuario
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: usuarioController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    labelText: 'Usuario',
                    filled: true,
                    fillColor: const Color(0xFFF0F8F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Campo Correo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: correoController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'Correo electrónico',
                    filled: true,
                    fillColor: const Color(0xFFF0F8F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Campo Contraseña
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: contrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: const Color(0xFFF0F8F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Campo Confirmar Contraseña
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: confirmarController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_person_outlined),
                    labelText: 'Confirmar contraseña',
                    filled: true,
                    fillColor: const Color(0xFFF0F8F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Botones de acción
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botón Registrar
                  Column(
                    children: [
                      IconButton(
                        iconSize: 60,
                        color: const Color(0xFF1E8449),
                        icon: const Icon(Icons.check_circle_outline),
                        onPressed: registrarUsuario, // 🔥 Aquí llama Firebase
                      ),
                      const Text(
                        'GUARDAR',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(width: 60),

                  // Botón Volver
                  Column(
                    children: [
                      IconButton(
                        iconSize: 60,
                        color: const Color(0xFF27AE60),
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                      const Text(
                        'VOLVER',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
