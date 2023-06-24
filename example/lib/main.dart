import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gradient Text',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Flutter Gradient Text'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Rainbow Text Without Reverse
            GradientAnimationText(
              text: Text(
                'Rainbow Text 1',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              colors: [
                Color(0xff8f00ff),
                Colors.indigo,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red,
              ],
              duration: Duration(seconds: 5),
            ),
            // Rainbow Text With Reverse
            GradientAnimationText(
              text: Text(
                'Rainbow Text 1',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              colors: [
                Color(0xff8f00ff),
                Colors.indigo,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red,
              ],
              duration: Duration(seconds: 5),
              reverse: true,
            ),
            // Gold Text 1
            GradientAnimationText(
              text: Text(
                'Gold Text 1',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              colors: [
                Colors.amber,
                Colors.white,
              ],
              duration: Duration(seconds: 5),
              reverse: true,
            ),
            // Gold Text 2
            GradientAnimationText(
              text: Text(
                'Gold Text 2',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              colors: [
                Colors.amber,
                Colors.amber,
                Colors.amber,
                Colors.white,
              ],
              duration: Duration(seconds: 5),
              reverse: true,
            ),
            // Tranform Text
            GradientAnimationText(
              text: Text(
                'Tranform Text',
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              colors: [
                Color(0xFF061A9C),
                Color(0xff92effd),
              ],
              duration: Duration(seconds: 5),
              transform: GradientRotation(math.pi / 4),
            ),
          ],
        ),
      ),
    );
  }
}
