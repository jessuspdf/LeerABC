import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ABECEDARIO'),
      debugShowCheckedModeBanner: false,
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

  @override
  void initState() {
    super.initState();
    print("Number of audio files: ${audioFiles.length}");
    print("Number of audio names: ${audioNames.length}");
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: audioFiles.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                player.play(AssetSource(audioFiles[index]));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                audioNames[index],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
