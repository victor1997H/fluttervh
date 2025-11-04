import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = TextEditingController();
    final contrasenaController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFEFF7EF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                'INICIAR SESIÓN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF145A32),
                ),
              ),
              const SizedBox(height: 20),

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

              const SizedBox(height: 30),

              // Botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botón Ingresar
                  Column(
                    children: [
                      IconButton(
                        iconSize: 60,
                        color: const Color(0xFF1E8449),
                        icon: const Icon(Icons.login),
                        onPressed: () {
                          // ✅ Navegar correctamente a la pantalla de inicio
                          Navigator.pushNamed(context, '/inicio');
                        },
                      ),
                      const Text(
                        'INGRESAR',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(width: 60),

                  // Botón Registrar
                  Column(
                    children: [
                      IconButton(
                        iconSize: 60,
                        color: const Color(0xFF27AE60),
                        icon: const Icon(Icons.app_registration),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                      const Text(
                        'REGISTRAR',
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
