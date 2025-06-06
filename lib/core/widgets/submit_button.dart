import 'package:flutter/material.dart';
import 'package:instastyle/core/theme/theme.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final bool isLoading;
  final VoidCallback onClick;

  const SubmitButton({
    super.key,
    required this.text,
    this.enabled = true,
    this.isLoading = false,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimensions.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.cornerRadiusSmall),
          ),
          backgroundColor:
              enabled ? Theme.of(context).colorScheme.primary : Colors.grey,
        ),
        onPressed: enabled && !isLoading ? onClick : null,
        child: isLoading
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(text),
      ),
    );
  }
}
