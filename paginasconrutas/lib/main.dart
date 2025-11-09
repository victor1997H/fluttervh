import 'package:flutter/material.dart';
import 'pantallas/login.dart';
import 'pantallas/register.dart';
import 'pantallas/inicio.dart';
import 'pantallas/guias.dart';
import 'pantallas/clima.dart';
import 'pantallas/permisos.dart';
import 'pantallas/ubicacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aventura360',
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const RegisterPage(), // ← corregido (la clase se llama RegisterPage)
        '/inicio': (context) => const Inicio(),
        '/guias': (context) => const GuiasPage(),
        '/clima': (context) => const ClimaPage(),
        '/permisos': (context) => const PermisosPage(),
      },
    );
  }
}
