import 'dart:async';
import 'dart:math';

import 'package:automotive_innovation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_linear_progress_indicator/wave_linear_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => Home())); // Navighează către ecranul principal
    });
  }

  double _progress = 0;

  Stream<double> _getDownloadProgress() async* {
    final values = <double>[
      0,
      0.1,
      0.2,
      0.3,
      0.4,
      0.45,
      0.7,
      0.85,
      0.9,
      0.95,
      0.99,
      1.0
    ];
    for (final p in values) {
      yield p;
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  void _increase() {
    final delta = Random().nextDouble();
    double newValue = _progress + delta;
    newValue = newValue.clamp(0, 1);
    setState(() {
      _progress = newValue;
    });
  }

  void _decrease() {
    final delta = Random().nextDouble();
    double newValue = _progress - delta;
    newValue = newValue.clamp(0, 1);
    setState(() {
      _progress = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors
            .white, // Poți să ajustezi culoarea de fundal dacă este necesar
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/traffic_recognition.jpg',
                fit: BoxFit.cover, // Umple ecranul, posibil decupând imaginea
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Centrarea verticală pentru coloană
                children: <Widget>[
                  Text(
                    'Asistență la Navigare',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 4.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Spațiu între text și loader
                  StreamBuilder<double>(
                      stream: _getDownloadProgress(),
                      builder: (context, snapshot) {
                        double progress = 0;
                        if (snapshot.hasData) {
                          progress = snapshot.data!;
                        }
                        return Container(
                            width: Get.width / 2,
                            child: WaveLinearProgressIndicator(
                              value: progress,
                              waveColor: Colors.orange,
                              color: Colors.orange,
                              waveBackgroundColor: Colors.orange,
                              backgroundColor: Colors.grey[150],
                              labelDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.transparent),
                            ));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
