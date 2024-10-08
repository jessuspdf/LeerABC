import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Atrapa2());
}

class Atrapa2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      appBar: AppBar(
        title: Text('Atrapa Letras'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FallingLettersGame(),
    );
  }
}

class FallingLettersGame extends StatefulWidget {
  @override
  _FallingLettersGameState createState() => _FallingLettersGameState();
}

class _FallingLettersGameState extends State<FallingLettersGame>
    with TickerProviderStateMixin {
  final Random _random = Random();
  final List<_FallingObject> _fallingObjects = [];
  int _score = 0;
  Timer? _timer;
  late AnimationController _animationController;
  String _nextLetter = 'A';
  final List<String> _letters = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ'.split('');
  final Set<String> _vowels = {'A', 'E', 'I', 'O', 'U'};
  double _leftMargin = 20;
  bool _gameStarted = false;
  late AnimationController _buttonAnimationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addListener(() {
            setState(() {
              _fallingObjects.forEach((object) {
                // Decrementa el valor de top para que los objetos suban
                object.top -= 2;
              });

              // Remueve los objetos que han salido de la pantalla por la parte superior
              _fallingObjects.removeWhere((object) => object.top < -100);

              if (_fallingObjects.any(
                  (object) => object.character == 'Z' && object.top <= 100)) {
                _endGame(false);
              }
            });
          });
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
    });

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _fallingObjects.add(_FallingObject(
          character: _nextLetter,
          left: _leftMargin +
              _random.nextDouble() *
                  (MediaQuery.of(context).size.width - 6 * _leftMargin),
          top: MediaQuery.of(context)
              .size
              .height, // Inicializa en la parte inferior
        ));

        int currentIndex = _letters.indexOf(_nextLetter);
        _nextLetter = _letters[(currentIndex + 1) % _letters.length];
      });

      if (_nextLetter == 'A' && _fallingObjects.isEmpty) {
        _timer?.cancel();
      }
    });
    _animationController.repeat();
  }

  void _onObjectTapped(_FallingObject object) {
    if (!_vowels.contains(object.character)) {
      _endGame(false);
    } else {
      setState(() {
        _fallingObjects.remove(object);
        _score++;
      });

      if (object.character == 'U' && _score == _vowels.length) {
        _endGame(true);
      }
    }
  }

  void _endGame(bool isWin) {
    _timer?.cancel();
    _animationController.stop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isWin ? 'Felicidades!' : 'Fin del juego'),
        content: Text(isWin
            ? 'Haz obtenido una puntuacion perfecta atrapando todas las vocales!'
            : 'Haz presionado una consonante. Puntuacion: $_score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _gameStarted = false;
                _score = 0;
                _fallingObjects.clear();
                _nextLetter = 'A';
              });
            },
            child: Text('Reiniciar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/OIG3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: [
              ..._fallingObjects.map((object) => Positioned(
                    top: object.top,
                    left: object.left,
                    child: GestureDetector(
                      onTap: () => _onObjectTapped(object),
                      child: Text(
                        object.character,
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Positioned(
                top: 16,
                left: 16,
                child: Text(
                  'Puntaje: $_score',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          if (!_gameStarted)
            Center(
              child: GestureDetector(
                onTap: _startGame,
                child: AnimatedBuilder(
                  animation: _buttonAnimationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Container(
                          width: 300, // Ajusta el ancho de la imagen
                          height: 200, // Ajusta la altura de la imagen
                          child: Image.asset(
                              'assets/play.png'), // Ruta de tu imagen de botón
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _FallingObject {
  _FallingObject(
      {required this.character, required this.left, required this.top});

  final String character;
  final double left;
  double top;
}
