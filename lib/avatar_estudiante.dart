import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'avatar2.dart';
import 'login.dart';
import 'menu_alumno.dart';
import 'package:flutter/services.dart';

void main() {
  // Aquí creas un mapa con los datos del usuario, por ejemplo, el nombre.
  Map<String, dynamic> user = {'username': 'Nombre del Usuario'};
  runApp(
      Avatar(user: user)); // Pasas el mapa con los datos del usuario a MyApp.
}

class Avatar extends StatelessWidget {
  final Map<String, dynamic> user;

  Avatar({required this.user});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Fluttermoji Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(
          title: 'Personaliza tu avatar',
          user: user), // Pasas el mapa con los datos del usuario a MyHomePage.
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title, required this.user}) : super(key: key);
  final String? title;
  final Map<String, dynamic>
      user; // Añades una propiedad para almacenar los datos del usuario.

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bienvenido a LEER JUGANDO ABC,\n${widget.user['username']}', // Añade \n para el salto de línea
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25),
          FluttermojiCircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 100,
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 3,
                child: Container(
                  height: 35,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text("Editar"),
                    onPressed: () async {
                      // Navega a la página de edición y espera a que se complete.
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewPage()),
                      );
                      // Después de regresar, actualiza el estado para reflejar los cambios.
                      setState(() {});
                    },
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 3,
                child: Container(
                  height: 35,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.navigate_next),
                    label: Text("Repaso"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuAlumno()),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 3,
                child: Container(
                  height: 35,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.navigate_next),
                    label: Text("Evaluacion"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuAlumno()),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
          SizedBox(height: 100),
          Row(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 3,
                child: Container(
                  height: 35,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.navigate_next),
                    label: Text("Salir"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
