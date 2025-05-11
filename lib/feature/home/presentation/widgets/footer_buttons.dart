import 'package:flutter/material.dart';

import 'select_buttons.dart';

class FooterButtons extends StatefulWidget {
  final ValueChanged<int> onSelect;
  const FooterButtons({super.key, required this.onSelect });

  @override
  State<FooterButtons> createState() => _FooterButtonsState();
}

int? isSelected = 1;

class _FooterButtonsState extends State<FooterButtons> {
  void toggleSelect(int index) {
    widget.onSelect(index);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSelect(1);
    });
  } 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            toggleSelect(1);
          },
          child: Text(
            'فونت',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            toggleSelect(2);
          },
          child: Text(
            'استایل',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            toggleSelect(3);
          },
          child: Text(
            'رنگ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
