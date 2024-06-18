import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class Sonido extends StatelessWidget {
  const Sonido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      appBar: AppBar(
        title: Text('ABECEDARIO'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MyHomePage(title: 'Pronunciacion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();

  final List<String> audioFiles = [
    'a.mp3',
    'b.mp3',
    'c.mp3',
    'd.mp3',
    'e.mp3',
    'f.mp3',
    'g.mp3',
    'h.mp3',
    'i.mp3',
    'j.mp3',
    'k.mp3',
    'l.mp3',
    'm.mp3',
    'n.mp3',
    'nn.mp3',
    'o.mp3',
    'p.mp3',
    'q.mp3',
    'r.mp3',
    's.mp3',
    't.mp3',
    'u.mp3',
    'v.mp3',
    'w.mp3',
    'x.mp3',
    'y.mp3',
    'z.mp3',
  ];

  final List<String> audioNames = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'NN',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  // Lista de rutas de imagen correspondientes a cada botón
  final List<String> buttonImages = [
    'assets/objetosAlfabeto/a.png',
    'assets/objetosAlfabeto/b.png',
    'assets/objetosAlfabeto/c.png',
    'assets/objetosAlfabeto/d.png',
    'assets/objetosAlfabeto/e.png',
    'assets/objetosAlfabeto/f.jpg',
    'assets/objetosAlfabeto/g.png',
    'assets/objetosAlfabeto/h.png',
    'assets/objetosAlfabeto/i.png',
    'assets/objetosAlfabeto/j.png',
    'assets/objetosAlfabeto/k.png',
    'assets/objetosAlfabeto/l.png',
    'assets/objetosAlfabeto/m.jpg',
    'assets/objetosAlfabeto/n.png',
    'assets/objetosAlfabeto/nn.jpg',
    'assets/objetosAlfabeto/o.png',
    'assets/objetosAlfabeto/p.png',
    'assets/objetosAlfabeto/q.png',
    'assets/objetosAlfabeto/r.jpg',
    'assets/objetosAlfabeto/s.png',
    'assets/objetosAlfabeto/t.png',
    'assets/objetosAlfabeto/u.png',
    'assets/objetosAlfabeto/v.jpg',
    'assets/objetosAlfabeto/w.png',
    'assets/objetosAlfabeto/x.png',
    'assets/objetosAlfabeto/y.png',
    'assets/objetosAlfabeto/z.png',

    // Agrega las rutas de imagen adicionales aquí
  ];

  @override
  void initState() {
    super.initState();
    print("Number of audio files: ${audioFiles.length}");
    print("Number of audio names: ${audioNames.length}");
  }

  void _showMessage(BuildContext context, String audioName, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imageUrl), // Muestra la imagen proporcionada
              Text(''),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cerrar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.pink],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: audioFiles.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                player.play(AssetSource(audioFiles[index]));
                _showMessage(context, audioNames[index], buttonImages[index]);
              },
              child: Image.asset(
                "assets/audio/${audioNames[index]}.png",
                width: 100.0,
                height: 100.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
