import 'package:flutter/material.dart';

class LightBox extends StatefulWidget {
  final Widget? child;
  const LightBox({super.key, required this.child});

  @override
  State<LightBox> createState() => _LightBoxState();
}

class _LightBoxState extends State<LightBox> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black.withOpacity(0.8),
              ),
              //   BoxShadow(
              //   blurRadius: 4,
              //   spreadRadius: 2,
              //   color: Colors.white.withOpacity(0.8),
              // )
            ]),
        child: widget.child,
      ),
    );
  }
}
