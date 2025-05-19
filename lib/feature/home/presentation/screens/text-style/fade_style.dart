import 'package:flutter/material.dart';

class FadeLineText extends StatefulWidget {
  final Widget? child;
  final String text;
  final double valueFontSize;

  const FadeLineText({
    super.key,
    required this.text,
    required this.valueFontSize,
    this.child,
  });

  @override
  State<FadeLineText> createState() => _FadeLineTextState();
}

class _FadeLineTextState extends State<FadeLineText> {
  @override
  Widget build(BuildContext context) {
    final lines = widget.text.split('\n');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: lines.map((line) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Fade Line Background
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8E2DE2) , Color(0xFF4A00E0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
            ),
            // Text Over Background
            Opacity(
              opacity: 0,
              child: Text(
                line,
                style: TextStyle(
                fontSize: widget.valueFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
             widget.child ?? Container()
          ],
        );
        
      }).toList(),
      
    );
  }
}
