<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
![Static Badge](https://img.shields.io/badge/flutter__gradient__animation__text-v1.0.0-8a2b) ![Static Badge](https://img.shields.io/badge/nullsafety-3.0.0-00b7eb) ![Static Badge](https://img.shields.io/badge/platform-flutter-ff69b4.svg) 


This package lets you make animated gradient texts without any hassle. 
Just pass the ```text```, ```colors```, the ```duration``` of the animation and you're done!
Using the ```transform``` and ```reverse```, you can achieve amazing effects.
For More info read the docs below.

## Getting started

Install the package using the following command:
```bash
flutter pub add flutter_gradient_animation_text
```
Import the package in your dart file using the following code:
```dart
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
```
And you are good to go!

## Usage

Create your animated gradient text.
The 3 required arguments are:
1. ```text```(Text): The text.
2. ```colors```(List\<Colors>): List of colors you want in your gradient.
3. ```duration```(Duration): Duration for which a single gradient animation runs.
```dart
// rainbow text
GradientAnimationText(
    text: Text(
        'Rainbow Text 1',
        style: TextStyle(
            fontSize: 50,
        ),
    ),
    colors: [
        Color(0xff8f00ff),  // violet
        Colors.indigo,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.orange,
        Colors.red,
    ],
    duration: Duration(seconds: 5),
),
```
![Rainbow Text 1](/images/rainbow-text-1.gif "Rainbow Text 1")

Reverse the animation.
This plays the animation backwards when a single iteration of the forward animation is completed.
You set ```reverse``` to true to enable this.
```dart
// rainbow text with reverse
GradientAnimationText(
    text: Text(
        'Rainbow Text 1',
        style: TextStyle(
            fontSize: 50,
        ),
    ),
    colors: [
        Color(0xff8f00ff),  // violet
        Colors.indigo,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.orange,
        Colors.red,
    ],
    duration: Duration(seconds: 5),
    reverse: true,  // reverse
),
```
![Rainbow Text 2](/images/rainbow-text-2.gif "Rainbow Text 2")

Play with colors.
You can use a color multiple times to increase the area covered by that color.
Gold Text Example:
These 2 Gold Text animations have different number of ```Colors.amber``` color.
```dart
// gold text 1
GradientAnimationText(
    text: Text(
        'Gold Text 1',
        style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
        ),
    ),
    colors: [
        Colors.amber,   // 1
        Colors.white,
    ],
    duration: Duration(seconds: 5),
    reverse: true,
),
// gold text 2
GradientAnimationText(
    text: Text(
        'Gold Text 2',
        style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
        ),
    ),
    colors: [
        Colors.amber,   // 1
        Colors.amber,   // 2
        Colors.amber,   // 3
        Colors.white,
    ],
    duration: Duration(seconds: 5),
    reverse: true,
),
```
![Gold Text](/images/gold-text.gif "Gold Text")

Transform your gradient.
You can transform your gradient using ```transform``` property.
Use [GradientTranform][gradient-transform] classes such as [SweepGradient][sweep-gradient], and [GradientRotation][gradient-rotation] to tranform.
```dart
// Tranform Text
GradientAnimationText(
    text: Text(
    'Tranform Text',
        style: TextStyle(
            fontSize: 90,
            fontWeight: FontWeight.bold,
        ),
    ),
    colors: [
        Color(0xFF061A9C),
        Color(0xff92effd),
    ],
    duration: Duration(seconds: 5),
    transform: GradientRotation(math.pi / 4),   // tranform
),
```
![Tranform Text](/images/transform-text.gif "Tranform Text")

## Available Properties
| Property        	| Type               	| Description                                          	|
|-----------------	|--------------------	|------------------------------------------------------	|
| ```text```      	| Text               	| The text to be used in the animation.                	|
| ```colors```    	| List<Color>        	| Colors of the animation.                             	|
| ```duration```  	| Duration           	| Duration for which a single gradient animation runs. 	|
| ```reverse```   	| bool?              	| If you want to reverse the animation.                	|
| ```transform``` 	| GradientTransform? 	| You can transform your gradient.                     	|
## Author
This package is developed by Sahil Shah.

- [GitHub][github]
- [LinkedIn][linkedin]

[gradient-transform]: https://api.flutter.dev/flutter/painting/GradientTransform-class.html
[sweep-gradient]: https://api.flutter.dev/flutter/painting/SweepGradient-class.html
[gradient-rotation]: https://api.flutter.dev/flutter/painting/GradientRotation-class.html
[github]: https://github.com/SahilDShaw
[linkedin]: https://www.linkedin.com/in/sahil-shah-pro/
