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
              text: 'Rainbow Text 1',
              fontSize: 50,
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
              text: 'Rainbow Text 2',
              fontSize: 50,
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
              text: 'Gold Text 1',
              fontSize: 50,
              colors: [
                Colors.amber,
                Colors.white,
              ],
              duration: Duration(seconds: 5),
              reverse: true,
              fontWeight: FontWeight.bold,
            ),
            // Gold Text 2
            GradientAnimationText(
              text: 'Gold Text 2',
              fontSize: 50,
              colors: [
                Colors.amber,
                Colors.amber,
                Colors.amber,
                Colors.white,
              ],
              duration: Duration(seconds: 5),
              reverse: true,
              fontWeight: FontWeight.bold,
            ),
            // Tranform Text
            GradientAnimationText(
              text: 'Tranform Text',
              fontSize: 50,
              colors: [
                Color(0xff4e65ff),
                Color(0xff92effd),
              ],
              duration: Duration(seconds: 5),
              transform: GradientRotation(math.pi / 4),
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
