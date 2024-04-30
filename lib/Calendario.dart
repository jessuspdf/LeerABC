// Importa los paquetes necesarios
import 'package:flutter/material.dart';

// Define las clases de las diferentes páginas
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leer jugando'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Define los botones para navegar a otras páginas
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagina2');
              },
              child: Text('Juego 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagina3');
              },
              child: Text('Juego 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagina4');
              },
              child: Text('Juego 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: Text('Contenido de la página 2'),
      ),
    );
  }
}

class Pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 3'),
      ),
      body: Center(
        child: Text('Contenido de la página 3'),
      ),
    );
  }
}

class Pagina4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 4'),
      ),
      body: Center(
        child: Text('Contenido de la página 4'),
      ),
    );
  }
}

// Punto de entrada de la aplicación
void main() {
  runApp(MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú en Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define las rutas nombradas
      routes: {
        '/': (context) => MyHomePage(),
        '/pagina2': (context) => Pagina2(),
        '/pagina3': (context) => Pagina3(),
        '/pagina4': (context) => Pagina4(),
      },
    );
  }
}
