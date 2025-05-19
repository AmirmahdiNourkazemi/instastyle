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
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.white10, // left fade start
                                
                            Color.fromARGB(255, 235, 219, 248),
                            Color.fromARGB(255, 228, 209, 247),
                            Color.fromARGB(255, 223, 199, 245),
                            Color.fromARGB(255, 228, 209, 247),
                            Color.fromARGB(255, 235, 219, 248),
                                
                            Colors.white10, // right fade end
                          ],
                          stops: [
                            0.0, 0.3, 0.4, 0.5, 0.6, 0.7,
                            1.0, // control fade position
                          ],
                        )),
                        child: Opacity(
                          opacity: 0,
                          child: Text(
                            txt,
                            style: TextStyle(
                              // height: 3,
                              fontSize: widget.valueFontSize ,
                            ),
                          ),
                        ),
                      ),
                    ),
              );
            }).toList()),
        Container(
          color: Colors.red,
          child: widget.child,
        ) ?? Container()
      ],
    );
  }
}
