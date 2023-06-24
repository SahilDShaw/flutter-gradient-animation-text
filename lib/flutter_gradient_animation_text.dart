library flutter_gradient_animation_text;

import 'package:flutter/material.dart';

class GradientAnimationText extends StatefulWidget {
  // data members
  final Text text;
  final List<Color> colors;
  final Duration duration;
  final bool? reverse;
  final GradientTransform? transform;

  // constructor
  const GradientAnimationText({
    required this.text,
    required this.colors,
    required this.duration,
    this.reverse,
    this.transform,
    super.key,
  });

  @override
  State<GradientAnimationText> createState() => _GradientAnimationTextState();
}

class _GradientAnimationTextState extends State<GradientAnimationText> with SingleTickerProviderStateMixin {
  // data members
  late AnimationController _animationController;
  late Animation _animation;
  late List<Color> colors;
  late int n;
  late double diff;
  late Text text;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    // animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // repeating animation
    _animationController.repeat(reverse: widget.reverse ?? false);

    // animation
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // colors
    colors = [];
    colors.add(widget.colors.last);
    colors.addAll(widget.colors);
    colors.addAll(widget.colors);

    // colors length
    n = widget.colors.length;

    // diff
    diff = (1 / n);
  }

  // creates stops dynamically based on the animation value
  List<double> stopsList() {
    int multiplier = -1 * n;
    List<double> stops = [];

    // generates (2*n + 1) stops
    while (multiplier <= n) {
      stops.add(_animation.value + (multiplier * diff));
      multiplier++;
    }

    return stops;
  }

  @override
  void dispose() {
    // disposing animationController
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      // copying the text with color as Colors.white
      child: Text(
        text.data!,
        key: text.key,
        locale: text.locale,
        maxLines: text.maxLines,
        overflow: text.overflow,
        textAlign: text.textAlign,
        selectionColor: text.selectionColor,
        semanticsLabel: text.semanticsLabel,
        softWrap: text.softWrap,
        strutStyle: text.strutStyle,
        style: (text.style != null) ? text.style!.copyWith(color: Colors.white) : const TextStyle(color: Colors.white),
        textDirection: text.textDirection,
        textHeightBehavior: text.textHeightBehavior,
        textScaleFactor: text.textScaleFactor,
        textWidthBasis: text.textWidthBasis,
      ),
      shaderCallback: (rect) {
        // gradient
        return LinearGradient(
          tileMode: TileMode.clamp,
          transform: widget.transform,
          stops: stopsList(),
          colors: colors,
        ).createShader(rect);
      },
    );
  }
}
