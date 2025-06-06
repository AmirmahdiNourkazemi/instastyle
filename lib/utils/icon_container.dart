
import 'package:flutter/material.dart';

import '../core/theme/theme.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final double size;
  final double padding;
  final TextDirection? textDirection;
  final VoidCallback? onTap;
  final Color? color;
  const IconContainer(
      {super.key,
      required this.icon,
      this.size = 30,
      this.padding = 2,
      this.textDirection,
      this.onTap , this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Directionality(
        textDirection: textDirection ?? TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(Dimensions.cornerRadiusSmall),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Icon(
              icon,
              size: size,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}