import 'package:abc/Inicio/loginapp.dart';
import 'package:flutter/material.dart';

class Registrar extends StatefulWidget {
  @override
  State<Registrar> createState() => _Registrar();
}

class _Registrar extends State<Registrar> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordrepController = TextEditingController();

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
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            _inputField("Nombre de usuario", usernameController),
            const SizedBox(height: 10),
            _inputField("Numero de telefono", lastnameController),
            const SizedBox(height: 10),
            _inputField("Contraseña", passwordController, isPassword: true),
            const SizedBox(height: 10),
            _inputField("Repetir contraseña", passwordrepController,
                isPassword: true),

            const SizedBox(height: 40),
            _registerBtn(), // Added registration button
            const SizedBox(height: 10),
            _regBtn(), // Added registration button
          ],
        ),
      ),
    );
  }

  Widget _registerBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Registrar()),
        );
        // Handle registration button click
        debugPrint(
            "Navigate to registration screen or perform registration action");
      },
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Registrar",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        onPrimary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _regBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Usuario : " + usernameController.text);
        debugPrint("Contraseña : " + passwordController.text);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Volver",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        onPrimary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
