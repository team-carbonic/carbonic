import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Bar extends StatefulWidget {
  final int index;
  final int maxOrder;
  final int order;
  const Bar({
    super.key,
    required this.index,
    required this.maxOrder,
    required this.order,
  });

  @override
  State<Bar> createState() => BarState();
}

class BarState extends State<Bar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  static const maxHeight = 300.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      value: 0,
      lowerBound: -500,
      upperBound: 500,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TickerFuture forward(
    final Duration duration, {
    final int step = 1,
  }) {
    return _controller.animateTo(
      step.toDouble(),
      duration: duration,
    );
  }

  TickerFuture reverse(
    final Duration duration, {
    final int step = 1,
  }) {
    return _controller.animateTo(
      -step.toDouble(),
      duration: duration,
    );
  }

  void reset() {
    _controller.stop();
    _controller.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final r =
        ((widget.order / (widget.maxOrder / 3)).clamp(0, 1) * 255).toInt();
    final g = (((widget.order - (widget.maxOrder / 3)) / (widget.maxOrder / 3))
                .clamp(0, 1) *
            255)
        .toInt();
    final b =
        (((widget.order - (widget.maxOrder * 2 / 3)) / (widget.maxOrder / 3))
                    .clamp(0, 1) *
                255)
            .toInt();

    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1, 0),
      ).animate(_controller),
      child: AnimatedContainer(
        duration: 500.ms,
        color: Color.fromRGBO(r, g, b, 1),
        height: widget.order / widget.maxOrder * maxHeight,
      ),
    );
  }
}
