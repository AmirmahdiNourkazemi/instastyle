import 'package:flutter/material.dart';

import 'mock_text_style.dart';

class SelectButtons extends StatefulWidget {
  final bool onSelect;
  final ValueChanged<TextStyle> onStyleSelected;
  const SelectButtons(
      {super.key, required this.onSelect, required this.onStyleSelected});

  @override
  State<SelectButtons> createState() => _SelectButtonsState();
}

class _SelectButtonsState extends State<SelectButtons> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCirc,
      height: widget.onSelect == true ? 70 : 0,
      width: MediaQuery.of(context).size.width,
      child: widget.onSelect
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: textStyleConfigs.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onStyleSelected(textStyleConfigs[index].toTextStyle());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.transparent,
                      border: Border.all(
                        color:
                            selectedIndex == index ? Colors.blue : Colors.grey,
                        width: selectedIndex == index ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        textStyleConfigs[index].name,
                        style: textStyleConfigs[index].toTextStyle(),
                        textDirection: TextDirection.rtl, // For Persian text
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
