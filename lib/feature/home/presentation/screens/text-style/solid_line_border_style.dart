import 'package:flutter/material.dart';

class SolidLineBorder extends StatefulWidget {
  final Widget? child;
  final String text;
  final double valueFontSize;
  const SolidLineBorder(
      {super.key,
      required this.child,
      required this.text,
      required this.valueFontSize});

  @override
  State<SolidLineBorder> createState() => _SolidLineBorderState();
}

class _SolidLineBorderState extends State<SolidLineBorder> {
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
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Opacity(
                      opacity: 0,
                      child: Text(
                        txt,
                        style: TextStyle(
                          fontSize: widget.valueFontSize,
                        ),
                      ),
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
