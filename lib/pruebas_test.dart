import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Letras Faltantes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MissingLetterGame(),
    );
  }
}

class MissingLetterGame extends StatefulWidget {
  @override
  _MissingLetterGameState createState() => _MissingLetterGameState();
}

class _MissingLetterGameState extends State<MissingLetterGame> {
  String _feedbackMessage = '';
  int _currentQuestion = 0;
  int _score = 0; // Variable para almacenar el puntaje

  final List<Map<String, dynamic>> _questions = [
    {
      'image':
          'https://cdn.pixabay.com/photo/2014/12/22/00/07/tree-576847_640.png',
      'word': 'Arb_l',
      'correctLetter': 'o',
      'options': ['a', 'o', 'e'],
    },
    {
      'image':
          'https://images.emojiterra.com/google/android-12l/512px/1f3e0.png',
      'word': 'C_s_',
      'correctLetter': 'a',
      'options': ['i', 'a', 'o'],
    },
    {
      'image':
          'https://www.mascotasanasydivertidas.com/wp-content/uploads/sites/12/2020/11/perro.png?w=442',
      'word': 'Pe_ro',
      'correctLetter': 'r',
      'options': ['r', 't', 'm'],
    },
  ];

  void _checkAnswer(String selectedLetter) {
    if (selectedLetter == _questions[_currentQuestion]['correctLetter']) {
      setState(() {
        _feedbackMessage = '¡Correcto!';
        _score += 10; // Sumar 10 puntos por cada respuesta correcta
      });
    } else {
      setState(() {
        _feedbackMessage = 'Incorrecto. Inténtalo de nuevo.';
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _feedbackMessage = '';
      });
    } else {
      setState(() {
        _feedbackMessage = 'Juego completado. ¡Bien hecho!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text('Juego de Letras Faltantes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  currentQuestion['image'],
                  height: 150,
                  errorBuilder: (context, error, stackTrace) =>
                      Text('Error al cargar imagen'),
                ),
                SizedBox(height: 20),
                Text(
                  currentQuestion['word'],
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: currentQuestion['options'].map<Widget>((letter) {
                    return ElevatedButton(
                      onPressed: () {
                        _checkAnswer(letter);
                      },
                      child: Text(
                        letter,
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  _feedbackMessage,
                  style: TextStyle(
                    fontSize: 24,
                    color: _feedbackMessage == '¡Correcto!'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text('Siguiente'),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Text(
                'Puntaje: $_score',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

