import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Progreso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      appBar: AppBar(
        title: Text('Progreso'),
      ),
      body: Container(
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _textArea("Puntajes"),
                SizedBox(height: 20.0),
                _elevatedButton("Regresar"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textArea(String hintText) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: Color.fromARGB(255, 248, 248, 248)),
    );

    return TextField(
      maxLines: 3,
      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color.fromARGB(255, 255, 254, 254)),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _elevatedButton(String text) {
    return ElevatedButton(
      onPressed: () {
        // Add your logic here for button press
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    );
  }
}
