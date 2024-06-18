import 'package:flutter/material.dart';
import 'abecedario.dart';
import 'atrapa_letras.dart';
import 'Nodisponible.dart';
import 'package:flutter/services.dart';

class Alfabeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Abecedario'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink, Colors.blue],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    _elevatedButton(
                      context,
                      'assets/audio/A.png',
                      'Pronunciación ABC',
                      Sonido(), // Navega a la pantalla Sonido
                    ),
                    SizedBox(height: 20.0),
                    _elevatedButton(
                      context,
                      'assets/opp.jpg',
                      'Atrapa Letras',
                      Atrapa(),
                    ),
                    SizedBox(height: 20.0),
                    _elevatedButton(
                      context,
                      'assets/audio/Nodisponible.jpg',
                      'No disponible',
                      ImageViewer(),
                    ),
                    SizedBox(height: 20.0),
                    _elevatedButton(
                      context,
                      'assets/audio/Nodisponible.jpg',
                      'No disponible',
                      ImageViewer(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  children: <Widget>[
                    _elevatedButton(
                      context,
                      'assets/audio/Nodisponible.jpg',
                      'No disponible',
                      ImageViewer(),
                    ),
                    SizedBox(height: 20.0),
                    _elevatedButton(
                      context,
                      'assets/audio/Nodisponible.jpg',
                      'No disponible',
                      ImageViewer(),
                    ),
                    SizedBox(height: 20.0),
                    _elevatedButton(
                      context,
                      'assets/audio/Nodisponible.jpg',
                      'No disponible',
                      ImageViewer(),
                    ),
                    SizedBox(height: 20.0),
                    _elevatedButton(
                      context,
                      'assets/audio/Nodisponible.jpg',
                      'No disponible',
                      ImageViewer(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _elevatedButton(
      BuildContext context, String imagePath, String buttonText, Widget page) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(
            width: 5.0,
            height: 5.0,
          ),
          Text(buttonText),
        ],
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(250, 150),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
