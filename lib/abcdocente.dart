import 'package:flutter/material.dart';
import 'package:abc/Repaso/abc_AbcSonido.dart';

void main() {
  runApp(menu2());
}

class menu2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu2(title: ''),
    );
  }
}

class Menu2 extends StatefulWidget {
  final String title;

  const Menu2({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Menu2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Spacer(flex: 2),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.navigate_next),
                      label: Text("Crear nuevo grupo"),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(flex: 2),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.navigate_next),
                      label: Text("Registrar Alumnos"),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => menu2()),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(flex: 2),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.navigate_next),
                      label: Text("Progreso"),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => menu2()),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
