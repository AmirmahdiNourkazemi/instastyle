import 'package:flutter/material.dart';

class StyledTextInput extends StatefulWidget {
  final TextStyle textStyle;
  final String initialText;
  final ValueChanged<String> onTextChanged;
  final FocusNode? focusNode;
  final TextEditingController controller;
  const StyledTextInput({
    super.key,
    required this.textStyle,
    this.initialText = '...متنت رو بنویس',
    required this.onTextChanged,
    this.focusNode,
    required this.controller,
  });

  @override
  State<StyledTextInput> createState() => _StyledTextInputState();
}

class _StyledTextInputState extends State<StyledTextInput> {
  late String _currentText;
  late FocusNode _focusNode;
  // late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _currentText = widget.initialText;
    _focusNode = widget.focusNode ?? FocusNode();
    // _controller = TextEditingController();

    // Request focus when widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    // _controller.dispose();
    // Only dispose the focus node if we created it
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        showCursor: true,
        autofocus: true,
        focusNode: _focusNode,
        controller: widget.controller,
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
          isCollapsed: true,
          hintText: _currentText,
          hintStyle: widget.textStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
