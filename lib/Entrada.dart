import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'inicioapp.dart';
import 'docente.dart';
// Importa la vista InicioApp

class OtraPantalla extends StatefulWidget {
  @override
  _OtraPantallaState createState() => _OtraPantallaState();
}

class _OtraPantallaState extends State<OtraPantalla> {
  final _usuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.blue,
            Colors.pink,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image(),
              SizedBox(height: 20.0),
              _inputField("Usuario", _usuarioController),
              SizedBox(height: 20.0),
              _inputField("Contraseña", _contrasenaController,
                  isPassword: true),
              SizedBox(height: 20.0),
              _elevatedButton("Iniciar Sesión", () {
                _iniciarSesion(context);
              }),
              SizedBox(height: 20.0),
              _elevatedButton("Registrar", () {
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: Colors.white),
    );

    return TextField(
      style: TextStyle(
          color:
              const Color.fromARGB(255, 255, 255, 255)), // Color del texto gris
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: const Color.fromARGB(
                255, 255, 255, 255)), // Color del hint gris
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _elevatedButton(String text, void Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _image() {
    return Image.asset(
      'assets/img.png',
      width: 180,
      height: 180,
    );
  }

  void _iniciarSesion(BuildContext context) async {
    String usuario = _usuarioController.text;
    String contrasena = _contrasenaController.text;

    // Abrir la base de datos
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'formulario5.db');

    Database database = await openDatabase(path);

    // Consultar si existe el usuario y la contraseña en la base de datos
    List<Map> result = await database.rawQuery(
        'SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?',
        [usuario, contrasena]);

    if (result.isNotEmpty) {
      // Si hay un resultado, significa que las credenciales son válidas
      String tipoUsuario = result[0]['tipoUsuario'];
      if (tipoUsuario == 'Docente') {
        // Si el usuario es docente, navega a la vista correspondiente
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        );
      } else if (tipoUsuario == 'Estudiante') {
        // Si el usuario es estudiante, navega a la vista correspondiente
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Docente()),
        );
      }
    } else {
      // Si no hay resultados, las credenciales son inválidas
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario o contraseña incorrectos.'),
        ),
      );
    }
  }
}
