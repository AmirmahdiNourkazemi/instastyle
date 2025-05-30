import 'package:flutter/material.dart';

class ShadowLine extends StatefulWidget {
  final Widget? child;
  final String text;
  final TextStyle textStyle;
  const ShadowLine(
      {super.key,
      required this.child,
      required this.text,
      required this.textStyle});

  @override
  State<ShadowLine> createState() => _ShadowLineState();
}

class _ShadowLineState extends State<ShadowLine> {
  @override
  Widget build(BuildContext context) {
    var lines = widget.text.split('\n');
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: lines.map((txt) {
              return Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 2,
                          color: Colors.white.withOpacity(0.8),
                        )
                      ]
                  ),
                    child: Text(
                      txt,
                      style: widget.textStyle,
                    ),
                  ),
                ),
              );
            }).toList()),
        widget.child ?? Container()
      ],
    );
  }
}
