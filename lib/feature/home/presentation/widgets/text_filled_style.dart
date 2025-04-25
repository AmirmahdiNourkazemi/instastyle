import 'package:flutter/material.dart';

class StyledTextInput extends StatefulWidget {
  final TextStyle textStyle;
  final String initialText;
  final ValueChanged<String> onTextChanged;

  const StyledTextInput({
    super.key,
    required this.textStyle,
    this.initialText = 'متن خود را وارد کنید',
    required this.onTextChanged,
  });

  @override
  State<StyledTextInput> createState() => _StyledTextInputState();
}

class _StyledTextInputState extends State<StyledTextInput> {
  late String _currentText;

  @override
  void initState() {
    super.initState();
    _currentText = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: widget.textStyle,
          onChanged: (value) {
            setState(() {
              _currentText = value;
            });
            widget.onTextChanged(value);
          },
          maxLines: null,
          decoration: InputDecoration(
            hintText: _currentText,
            hintStyle: widget.textStyle,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}