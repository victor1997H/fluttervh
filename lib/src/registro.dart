import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 👈 Para manejar fechas

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final TextEditingController _fechaController = TextEditingController();
  String? _generoSeleccionado;
  String? _estadoSeleccionado;

  final List<String> estados = [
    'Activo',
    'Inactivo',
    'Pendiente',
  ];

  final List<String> generos = [
    'Masculino',
    'Femenino',
    'Otro',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Encabezado con logo
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 23, 194, 128),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 25,
                  right: 40,
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "imagen/trail.jpg", // 👈 tu logo aquí
                          height: 140,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Aventura360",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              color: Colors.black38,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // FORMULARIO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "REGISTRAR RUTA",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 90, 56),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Nombre y Apellido
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField('Nombre', Icons.person),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField('Apellido', Icons.person_outline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    _buildTextField('Correo Electrónico', Icons.email),
                    const SizedBox(height: 15),
                    _buildTextField('Dirección', Icons.location_on),
                    const SizedBox(height: 15),

                    // Estado
                    DropdownButtonFormField<String>(
                      value: _estadoSeleccionado,
                      decoration: _inputDecoration('Estado', Icons.flag),
                      items: estados.map((estado) {
                        return DropdownMenuItem<String>(
                          value: estado,
                          child: Text(estado),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _estadoSeleccionado = value;
                        });
                      },
                    ),
                    const SizedBox(height: 15),

                    // Fecha de nacimiento
                    TextField(
                      controller: _fechaController,
                      readOnly: true,
                      decoration: _inputDecoration('Fecha de nacimiento', Icons.calendar_today),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _fechaController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 15),

                    // Género
                    DropdownButtonFormField<String>(
                      value: _generoSeleccionado,
                      decoration: _inputDecoration('Género', Icons.wc),
                      items: generos.map((genero) {
                        return DropdownMenuItem<String>(
                          value: genero,
                          child: Text(genero),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _generoSeleccionado = value;
                        });
                      },
                    ),
                    const SizedBox(height: 15),

                    _buildTextField('Nombre de Ruta', Icons.map),
                    const SizedBox(height: 15),

                    _buildTextField('Contraseña', Icons.lock, isPassword: true),
                    const SizedBox(height: 15),
                    _buildTextField('Confirmar Contraseña', Icons.lock_outline, isPassword: true),
                    const SizedBox(height: 20),

                    // Checkbox
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Expanded(
                          child: Text(
                            'Al crear tu cuenta aceptas los Términos y Condiciones.',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Botón registrar
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1ABC9C),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cuenta creada con éxito ✅'),
                            ),
                          );
                        },
                        child: const Text(
                          'CREAR REGISTRO RUTA',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                    const Text('O regístrate usando'),
                    const SizedBox(height: 10),

                    // Botones sociales
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton(Icons.facebook, 'Facebook'),
                        const SizedBox(width: 20),
                        _socialButton(Icons.alternate_email, 'Twitter'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Campo de texto normal
  Widget _buildTextField(String label, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: _inputDecoration(label, icon),
    );
  }

  // Decoración de campos
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF1ABC9C)),
      filled: true,
      fillColor: const Color(0xFFF0F8F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  // Botón social
  Widget _socialButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1ABC9C),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF1ABC9C)),
        ),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
