import 'package:flutter/material.dart';

class TextReveal extends StatefulWidget {
  const TextReveal(
      {super.key,
      required this.child,
      required this.maxHeight,
      required this.controller,
      this.textRevealAnimation,
      this.textOpacityAnimation});
  final Widget child;
  final double maxHeight;
  final AnimationController controller;
  final Animation<double>? textRevealAnimation;
  final Animation<double>? textOpacityAnimation;

  @override
  State<TextReveal> createState() => _TextRevealState();
}

class _TextRevealState extends State<TextReveal> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    textRevealAnimation = widget.textRevealAnimation ??
        Tween<double>(begin: 100, end: 0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
          ),
        );
    textOpacityAnimation = widget.textOpacityAnimation ??
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return LimitedBox(
          maxHeight: widget.maxHeight,
          child: Container(
            padding: EdgeInsets.only(top: textRevealAnimation.value),
            child: FadeTransition(
              opacity: textOpacityAnimation,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
