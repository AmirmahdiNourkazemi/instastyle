import 'package:flutter/material.dart';

import 'mock_text_style.dart';

class FontsListView extends StatefulWidget {
  final ValueChanged<TextStyle> onStyleSelected;
  const FontsListView({super.key, required this.onStyleSelected});

  @override
  State<FontsListView> createState() => _FontsListViewState();
}

class _FontsListViewState extends State<FontsListView> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                  : Theme.of(context).colorScheme.onPrimary,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: selectedIndex == index ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                textStyleConfigs[index].name,
                style: textStyleConfigs[index].toTextStyle().copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 0.2
                    ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
