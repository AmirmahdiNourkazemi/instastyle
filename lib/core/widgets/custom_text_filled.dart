import 'package:instastyle/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int maxLength;
  final bool infiniteLenght;
  final VoidCallback? onTap;
  final bool onChange;
  final String? hintText;
  final Widget? prefixWidget;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? readOnly;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.title,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.name,
      this.suffixIcon,
      this.validator,
      this.maxLength = 20,
      this.infiniteLenght = false,
      this.onTap,
      this.onChange = false,
      this.hintText,
      this.prefixWidget,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly!,
      textDirection: TextDirection.rtl,
      textInputAction: textInputAction,
      onChanged: (value) {
        if (value.length > 2 && onChange) {
          onTap!();
        }
      },
      keyboardType: textInputType,
      style: Theme.of(context).textTheme.bodyMedium,
      onFieldSubmitted: (_) {
        if (textInputAction == TextInputAction.next) {
          FocusScope.of(context).nextFocus();
        } else if (textInputAction == TextInputAction.search) {
          FocusScope.of(context).nextFocus();
          onTap!();
        }
      },
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: infiniteLenght ? null : maxLength,
      maxLines: infiniteLenght ? null : 1, // Expands dynamically if infinite
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
        counterStyle: const TextStyle(height: double.minPositive),
        counterText: '',
        prefixIcon: suffixIcon,
        suffixIcon: prefixWidget ??
            IconButton(
              onPressed: () => controller.clear(),
              icon: const Icon(MingCute.close_line),
            ),
        label: Text(
          title,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.cornerRadiusSmall)),
        ),
      ),
      validator: validator,
    );
  }
}
