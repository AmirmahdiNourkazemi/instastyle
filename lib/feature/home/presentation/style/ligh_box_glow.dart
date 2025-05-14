import 'package:flutter/material.dart';

class LightBoxGlow extends StatefulWidget {
  final Widget? child;
  const LightBoxGlow({super.key, required this.child});

  @override
  State<LightBoxGlow> createState() => _LightBoxGlowState();
}

class _LightBoxGlowState extends State<LightBoxGlow> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.white.withOpacity(0.8),
                )
              ]),
          child: widget.child,
        ),
      ),
    );
  }
}
