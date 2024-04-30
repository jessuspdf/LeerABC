import 'package:abc/abcdocente.dart';
import 'package:abc/Avatar/editaravatar.dart';

import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

void main() {
  runApp(Docente());
}

class Docente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttermoji Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(title: 'Leer Jugando ABC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Bienvenido a LEER JUGANDO ABC (Docente)",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          FluttermojiCircleAvatar(
            backgroundColor: Color.fromARGB(255, 226, 213, 213),
            radius: 90,
          ),
          SizedBox(
            height: 5,
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
                  height: 30,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text("Editar Avatar"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage()),
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
                    label: Text("Administracion"),
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
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
