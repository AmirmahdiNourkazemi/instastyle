import 'package:flutter/material.dart';

import 'select_buttons.dart';

class FooterButtons extends StatefulWidget {
  final ValueChanged<bool> onSelect;
  const FooterButtons({super.key, required this.onSelect});

  @override
  State<FooterButtons> createState() => _FooterButtonsState();
}

class _FooterButtonsState extends State<FooterButtons> {
  bool isSelected = true;
  void toggleSelect() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onSelect(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            toggleSelect();
          },
          child: Text(
            'فونت',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            toggleSelect();
          },
          child: Text(
            'استایل',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            toggleSelect();
          },
          child: Text(
            'رنگ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            toggleSelect();
          },
          child: Text(
            'انیمیشن',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
