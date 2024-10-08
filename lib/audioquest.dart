import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Palabras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordGuessGame(),
    );
  }
}

class WordGuessGame extends StatefulWidget {
  @override
  _WordGuessGameState createState() => _WordGuessGameState();
}

class _WordGuessGameState extends State<WordGuessGame> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final TextEditingController _controller = TextEditingController();
  int _score = 0;
  int _currentActivity = 0;

  final List<Map<String, String>> _activities = [
    {'word': 'arbol', 'audio': 'audio/a.mp3'},
    {'word': 'pelota', 'audio': 'audio/p.mp3'},
    {'word': 'gato', 'audio': 'audio/g.mp3'},
    {'word': 'uva', 'audio': 'audio/u.mp3'},
  ];

  String _feedbackMessage = "";

  void _playSound(String audioPath) async {
    await _audioPlayer.play(AssetSource(audioPath));
  }

  void _checkAnswer() {
    String correctWord = _activities[_currentActivity]['word']!;
    if (_controller.text.trim().toLowerCase() == correctWord) {
      setState(() {
        _feedbackMessage = "¡Correcto! +10 puntos";
        _score += 10;
      });
    } else {
      setState(() {
        _feedbackMessage = "Incorrecto. La palabra correcta era: $correctWord";
      });
    }
    _nextActivity();
  }

  void _nextActivity() {
    if (_currentActivity < _activities.length - 1) {
      setState(() {
        _currentActivity++;
        _controller.clear();
        _feedbackMessage = '';
      });
    } else {
      _showFinalScore();
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Juego completado"),
          content: Text("Tu puntaje final es: $_score"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _score = 0;
                  _currentActivity = 0;
                  _controller.clear();
                  _feedbackMessage = '';
                });
              },
              child: Text("Jugar de nuevo"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina la Palabra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Actividad ${_currentActivity + 1} de ${_activities.length}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.audiotrack, size: 50, color: Colors.blue),
              onPressed: () {
                _playSound(_activities[_currentActivity]['audio']!);
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Escribe la palabra que escuchaste',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: Text('Comprobar'),
            ),
            SizedBox(height: 20),
            Text(
              _feedbackMessage,
              style: TextStyle(
                fontSize: 20,
                color: _feedbackMessage.contains("Correcto")
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
