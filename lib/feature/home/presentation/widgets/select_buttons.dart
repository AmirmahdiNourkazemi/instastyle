import 'package:flutter/material.dart';
import 'package:instastyle/feature/home/presentation/widgets/fonts_list_view.dart';
import 'package:instastyle/feature/home/presentation/widgets/style_list_view.dart';

import 'color_list_view.dart';
import 'mock_text_style.dart';

class SelectButtons extends StatefulWidget {
  final int onSelect;
  final ValueChanged<TextStyle> onStyleSelected;
  final ValueChanged<Widget Function({required Widget child})> onWidgetSelected;

  final ValueChanged<Color> onColorSelected;
  final Widget? child;
  const SelectButtons(
      {super.key,
      required this.onSelect,
      required this.onStyleSelected,
      required this.onWidgetSelected,
      required this.onColorSelected,
      this.child});

  @override
  State<SelectButtons> createState() => _SelectButtonsState();
}

class _SelectButtonsState extends State<SelectButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: widget.onSelect == 1
          ? FontsListView(
              onStyleSelected: widget.onStyleSelected,
            ) 
          : widget.onSelect == 2 ?
            StyleListView(
              onWidgetSelected: widget.onWidgetSelected,
            ):
           widget.onSelect == 3
              ? ColorListView(
                  colorSelected: widget.onColorSelected,
                )
              : null,
    );
  }
}
