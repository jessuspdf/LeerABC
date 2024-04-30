import 'package:flutter/material.dart';
import 'package:abc/Calendario.dart';

void main() {
  runApp(menu2());
}

class menu2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 11, 80, 126),
      ),
      home: Menu2(title: ''),
    );
  }
}

class Menu2 extends StatefulWidget {
  final String title;

  const Menu2({Key? key, required this.title}) : super(key: key);

  @override
  _Menu2State createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
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
            SizedBox(height: 20),
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
                  // Acción cuando se presiona el botón Vocales
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
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
            SizedBox(height: 20),
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
                  // Acción cuando se presiona el botón Silabas
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
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
    );
  }
}
