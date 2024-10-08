import 'package:flutter/material.dart';

import 'Nodisponible.dart';
import 'menu_alfabeto.dart';
import 'package:flutter/services.dart';

class MenuAlumno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Repaso',
          style: TextStyle(
            color: const Color.fromARGB(
                255, 5, 5, 5), // Cambiar color del texto a blanco
          ),
        ),
        backgroundColor: Colors.transparent, // Hacer el AppBar transparente
        elevation: 0, // Quitar sombra del AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 11, 80, 126), // Morado intenso
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 241, 154, 22), // Naranja
                      Color.fromARGB(255, 231, 68, 122), // Rosa
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar a la vista de "Crear Nuevo Grupo"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alfabeto()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                  
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Alfabeto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio entre los botones
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 241, 154, 22), // Naranja
                      Color.fromARGB(255, 231, 68, 122), // Rosa
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar a la vista de "Registrar Alumno"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageViewer()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Vocales',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio entre los botones
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 241, 154, 22), // Naranja
                      Color.fromARGB(255, 231, 68, 122), // Rosa
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar a la vista de "Progreso"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageViewer()),
                    );
                  },
                  style: ElevatedButton.styleFrom(

                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Silabas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
