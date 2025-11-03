import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallasDinamicas(),
    );
  }
}

class PantallasDinamicas extends StatefulWidget {
  const PantallasDinamicas({super.key});
  @override
  State<PantallasDinamicas> createState() => _PantallasDinamicasState();
}

class _PantallasDinamicasState extends State<PantallasDinamicas> {
  final PageController _pageController = PageController();
  int _index = 0;

  final List<Map<String, dynamic>> pantallas = [
    {"color": Colors.indigo, "titulo": "Inicio", "imagen": "images/mundo.jpg", "icon": Icons.home},
    {"color": Colors.pinkAccent, "titulo": "Buscar", "imagen": "images/buscar.jpg", "icon": Icons.search},
    {"color": Colors.teal, "titulo": "Favoritos", "imagen": "images/camin.jpg", "icon": Icons.favorite},
    {"color": Colors.orange, "titulo": "Perfil", "imagen": "images/gato.jpg", "icon": Icons.person},
    {"color": Colors.deepPurple, "titulo": "Ajustes", "imagen": "images/luz.jpg", "icon": Icons.settings},
    {"color": Colors.yellowAccent, "titulo": "Ayuda", "imagen": "images/luz.jpg", "icon": Icons.help_outline},
  ];

  void _cambiarPagina(int newIndex) {
    _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    setState(() => _index = newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // GIF de fondo siempre visible
          Positioned.fill(
            child: Image.asset(
              'images/gif.gif',
              fit: BoxFit.cover,
            ),
          ),
          // PageView con imágenes encima del GIF, con opacidad ajustada
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _index = i),
            itemCount: pantallas.length,
            itemBuilder: (context, i) {
              return Opacity(
                opacity: 0.7, // <-- más visible, menos opaco
                child: Image.asset(
                  pantallas[i]["imagen"],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              );
            },
          ),
          // Fondo semitransparente adicional
          Container(color: Colors.black.withOpacity(0.1)),

          // Título
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Text(
              pantallas[_index]["titulo"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Botones "Atrás" y "Siguiente"
          Positioned(
            bottom: 20,
            left: 20,
            child: _index > 0
                ? ElevatedButton(
                    onPressed: () =>
                        _cambiarPagina((_index - 1).clamp(0, pantallas.length - 1)),
                    child: const Text("← Atrás"),
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () => _cambiarPagina((_index + 1) % pantallas.length),
              child: const Text("Siguiente →"),
            ),
          ),
          // Barra de íconos brillantes y animados
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(pantallas.length, (i) {
                bool selected = i == _index;
                return GestureDetector(
                  onTap: () => _cambiarPagina(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.all(6), // un poco más pequeño
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: pantallas[i]["color"].withOpacity(0.9),
                                blurRadius: 20,
                                spreadRadius: 2,
                              )
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedScale(
                          scale: selected ? 1.4 : 1, // íconos un poco más pequeños
                          duration: const Duration(milliseconds: 500),
                          child: Icon(
                            pantallas[i]["icon"],
                            color: selected ? pantallas[i]["color"] : Colors.white70,
                            size: selected ? 36 : 28, // tamaño más pequeño
                          ),
                        ),
                        const SizedBox(height: 3),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 500),
                          style: TextStyle(
                            color: selected ? pantallas[i]["color"] : Colors.white70,
                            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                          ),
                          child: Text(pantallas[i]["titulo"], style: const TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
