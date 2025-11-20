import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = TextEditingController();
    final contrasenaController = TextEditingController();

    Future<void> login() async {
      final email = usuarioController.text.trim();
      final pass = contrasenaController.text.trim();

      if (email.isEmpty || pass.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ingresa tu correo y contraseña")),
        );
        return;
      }

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );

        Navigator.pushNamed(context, '/inicio');

      } on FirebaseAuthException catch (e) {
        String mensaje = switch (e.code) {
          'user-not-found' => "El usuario no existe. Regístrate primero.",
          'wrong-password' => "Contraseña incorrecta.",
          'invalid-email' => "Correo inválido.",
          'user-disabled' => "El usuario está deshabilitado.",
          _ => "Error: ${e.message}",
        };

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(mensaje)));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEFF7EF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Encabezado
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
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/trail.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
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
                'INICIAR SESIÓN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF145A32),
                ),
              ),

              const SizedBox(height: 20),

              // Correo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: usuarioController,
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

              // Contraseña
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

              const SizedBox(height: 30),

              // BOTONES
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 60,
                        color: const Color(0xFF1E8449),
                        icon: const Icon(Icons.login),
                        onPressed: login,
                      ),
                      const Text('INGRESAR'),
                    ],
                  ),
                  const SizedBox(width: 60),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 60,
                        color: const Color(0xFF27AE60),
                        icon: const Icon(Icons.app_registration),
                        onPressed: () => Navigator.pushNamed(context, '/register'),
                      ),
                      const Text('REGISTRAR'),
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
