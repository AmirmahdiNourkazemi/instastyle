import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

Future showToast(BuildContext context, String title, String description,
    ToastificationType type,
    {bool isIconMessage = false}) async {
  toastification.show(
    showIcon: true,
    alignment: Alignment.bottomCenter,
    direction: TextDirection.rtl,
    context: context,
    type: type,
    style: isIconMessage
        ? ToastificationStyle.minimal
        : ToastificationStyle.flatColored,
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    showProgressBar: isIconMessage ? false : true,
    dragToClose: true,
    autoCloseDuration: const Duration(seconds: 5),
    applyBlurEffect: true,
    description: isIconMessage
        ? null
        : description.isEmpty
            ? null
            : Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
  );
}
