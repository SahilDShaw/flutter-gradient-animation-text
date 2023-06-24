library flutter_gradient_animation_text;

import 'package:flutter/material.dart';

class GradientAnimationText extends StatefulWidget {
  final String text;
  final List<Color> colors;
  final Duration duration;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? reverse;
  final GradientTransform? transform;
  const GradientAnimationText({
    required this.text,
    required this.colors,
    required this.duration,
    required this.fontSize,
    this.fontWeight,
    this.reverse,
    this.transform,
    super.key,
  });

  @override
  State<GradientAnimationText> createState() => _GradientAnimationTextState();
}

class _GradientAnimationTextState extends State<GradientAnimationText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late List<Color> colors;
  late int n;
  late double diff;

  @override
  void initState() {
    super.initState();
    // animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animationController.repeat(reverse: widget.reverse ?? true);

    // animation
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // colors
    colors.add(widget.colors.last);
    colors.addAll(widget.colors);
    colors.addAll(widget.colors);

    // colors length
    n = widget.colors.length;

    // diff
    diff = (1 / n);
  }

  List<double> stopsList() {
    int multiplier = -1 * n;
    List<double> stops = [];

    while (multiplier <= n) {
      stops.add(_animation.value + (multiplier * diff));
      multiplier++;
    }

    return stops;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: (widget.fontWeight) ?? FontWeight.normal,
          color: Colors.white,
        ),
      ),
      shaderCallback: (rect) {
        return LinearGradient(
          tileMode: TileMode.clamp,
          transform: widget.transform,
          stops: stopsList(),
          colors: widget.colors,
        ).createShader(rect);
      },
    );
  }
}
