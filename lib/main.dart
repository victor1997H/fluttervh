import 'package:flutter/material.dart';
import 'package:ejemplo/src/app.dart';
import 'package:ejemplo/src/registro.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      
      // 👇 Agregamos rutas para que Navigator.pushNamed funcione
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),       // Pantalla principal
        '/registro': (context) => const RegistroPage(), // Pantalla de registro
      },
    );
  }
}
