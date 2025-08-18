import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:instastyle/core/localstorage/local_data.dart';
import 'package:instastyle/core/theme/theme.dart';
import 'package:instastyle/feature/auth/presentation/screen/login_screen.dart';
import 'package:instastyle/feature/product/presentation/widget/product_buttom_sheet.dart';
import 'package:instastyle/main.dart' show navigatorKey;

PreferredSizeWidget appBar({
  required String title,
  List<Widget>? actions,
  Widget? leading,
  bool centerTitle = true,
  bool showUsage = false,
}) {
  return AppBar(
      leadingWidth: 130,
      title: Text(
        title,
        style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
      ),
      centerTitle: centerTitle,
      actions: actions,
      leading: showUsage
          ? Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: ValueListenableBuilder(
                valueListenable: LocalData.statusNotifier,
                builder: (context, value, child) {
                  bool isPro;
                  if (value == null || value.products!.isEmpty) {
                    isPro = false;
                  } else {
                    isPro = true;
                  }
                  if (isPro) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'اشتراک دارید',
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              width: Dimensions.marginExtraSmall,
                            ),
                            Icon(
                              MingCute.trophy_line,
                              size: 20,
                            ),
                          ],
                        ),
                        Text(LocalData.userMobileNumberNotifier.value,
                            style: const TextStyle(fontSize: 10))
                      ],
                    );
                  }
                  return TextButton.icon(
                      onPressed: () {
                        if (LocalData.firstTokenNotifier.value.isEmpty &&
                            navigatorKey.currentState != null) {
                          showLoginButtonSheet(
                              navigatorKey.currentState!.context);
                        } else if (LocalData.statusNotifier.value == null) {
                          productModalButtonSheet(
                              navigatorKey.currentState!.context);
                        }
                      },
                      icon: const Icon(MingCute.store_line),
                      label: const Text(
                        'خرید اشتراک',
                        style: TextStyle(fontSize: 12),
                      ));
                },
              ),
            )
          : null);
}
