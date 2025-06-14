import 'package:flutter/material.dart';

import 'select_buttons.dart';

class FooterButtons extends StatefulWidget {
  final ValueChanged<int> onSelect;
  const FooterButtons({super.key, required this.onSelect});

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
        customTextButton(
          isSelected: isSelected == 1,
          context: context,
          onTap: () {
            toggleSelect(1);
            setState(() {
              isSelected = 1;
            });
          },
          text: Text(
            'فونت',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isSelected == 1
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        customTextButton(
          isSelected: isSelected == 2,
          context: context,
          onTap: () {
            toggleSelect(2);
            setState(() {
              isSelected = 2;
            });
          },
          text: Text(
            'رنگ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isSelected == 2
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        customTextButton(
          isSelected: isSelected == 3,
          context: context,
          onTap: () {
            toggleSelect(3);
            setState(() {
              isSelected = 3;
            });
          },
          text: Text(
            'استایل',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isSelected == 3
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        customTextButton(
          isSelected: isSelected == 4,
          context: context,
          onTap: () {
            toggleSelect(4);
            setState(() {
              isSelected = 4;
            });
          },
          text: Text(
            'متن',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isSelected == 4
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
      ],
    );
  }
}

Widget customTextButton(
    {required BuildContext context,
    required VoidCallback onTap,
    required Text text,
    required bool isSelected}) {
  return TextButton(
    style: TextButton.styleFrom(
      side: BorderSide(
        
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          width: isSelected ? 2 : 1),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(15),
      )),
      backgroundColor: isSelected
          ? Theme.of(context).colorScheme.primary
          : Colors.transparent,
    ),
    onPressed: onTap,
    child: text,
  );
}
