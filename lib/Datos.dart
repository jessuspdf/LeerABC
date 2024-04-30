import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Entrada.dart';
// Importa la vista OtraClase

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('es', 'ES'),
      title: 'Formulario SQLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormularioPage(),
    );
  }
}

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _nombreController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();
  String _tipoUsuario = 'Docente';
  String _genero = 'Masculino';

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
        backgroundColor: Color.fromRGBO(146, 32, 32, 0),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _inputField("Nombre", _nombreController),
              SizedBox(height: 20.0),
              _inputField("Usuario", _usuarioController),
              SizedBox(height: 20.0),
              _inputField("Contraseña", _contrasenaController,
                  isPassword: true),
              SizedBox(height: 20.0),
              _dropdownFormField(
                  "Tipo de Usuario", _tipoUsuario, ['Docente', 'Estudiante']),
              SizedBox(height: 20.0),
              _dropdownFormField(
                  "Género", _genero, ['Masculino', 'Femenino', 'Otro']),
              SizedBox(height: 20.0),
              _elevatedButton("Registrar", () {
                _guardarInformacion(context);
              }),
              SizedBox(height: 20.0),
              _elevatedButton("Regresar", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtraPantalla()),
                );
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
      borderSide: BorderSide(color: Color.fromARGB(255, 248, 248, 248)),
    );

    return TextField(
      style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255)), // Color del texto gris
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Color.fromARGB(255, 255, 254, 254)), // Color del hint gris
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _dropdownFormField(String label, String value, List<String> items) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: (String? newValue) {
        setState(() {
          value = newValue!;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item,
              style: TextStyle(
                  color:
                      Color.fromARGB(255, 46, 44, 44))), // Color del texto gris
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255)), // Color del label gris
      ),
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

  void _guardarInformacion(BuildContext context) async {
    String nombre = _nombreController.text;
    String usuario = _usuarioController.text;
    String contrasena = _contrasenaController.text;
    String tipoUsuario = _tipoUsuario;
    String genero = _genero;

    // Verificar si algún campo está vacío
    if (nombre.isEmpty || usuario.isEmpty || contrasena.isEmpty) {
      // Mostrar mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, completa todos los campos.'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Detener la ejecución
    }

    // Abrir la base de datos
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'formulario5.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // Crear la tabla si no existe
      await db.execute(
          'CREATE TABLE IF NOT EXISTS usuarios (id INTEGER PRIMARY KEY, nombre TEXT, usuario TEXT, contrasena TEXT, tipoUsuario TEXT, genero TEXT)');
    });

    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO usuarios(nombre, usuario, contrasena, tipoUsuario, genero) VALUES(?, ?, ?, ?, ?)',
          [nombre, usuario, contrasena, tipoUsuario, genero]);
    });

    // Mostrar un mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Información guardada exitosamente.'),
      ),
    );
  }
}
