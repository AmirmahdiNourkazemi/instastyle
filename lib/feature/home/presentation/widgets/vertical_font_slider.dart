import 'package:flutter/material.dart';

class VerticalFontSlider extends StatefulWidget {
   final double initialSize;
  final ValueChanged<double> onSizeChanged;
  const VerticalFontSlider({super.key , required this.initialSize, required this.onSizeChanged});

  @override
  State<VerticalFontSlider> createState() => _VerticalFontSliderState();
}

class _VerticalFontSliderState extends State<VerticalFontSlider> {
    late double _currentSize;

  @override
  void initState() {
    super.initState();
    _currentSize = widget.initialSize;
  }
  @override
  Widget build(BuildContext context) {
   return Positioned(
      top: MediaQuery.of(context).size.height / 4,
      child: RotatedBox(
        quarterTurns: -1,
        child: Slider(
          min: 10,
          max: 70,
          value: _currentSize,
          onChanged: (value) {
            setState(() {
              _currentSize = value;
            });
            widget.onSizeChanged(value);
          },
        ),
      ),
    );
  }
  }
