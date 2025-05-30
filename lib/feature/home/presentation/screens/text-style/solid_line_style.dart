import 'package:flutter/material.dart';

class SolidLine extends StatefulWidget {
  final Widget? child;
  final String text;
  final TextStyle textStyle;
  const SolidLine(
      {super.key,
      required this.child,
      required this.text,
      required this.textStyle});

  @override
  State<SolidLine> createState() => _SolidLineState();
}

class _SolidLineState extends State<SolidLine> {
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
                    color: Colors.white,
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
