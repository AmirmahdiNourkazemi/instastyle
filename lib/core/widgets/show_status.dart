import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:instastyle/core/localstorage/local_data.dart';
import 'package:instastyle/core/theme/theme.dart';
import 'package:instastyle/feature/product/presentation/widget/product_buttom_sheet.dart';

Widget containerShowStatus() {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: LocalData.statusNotifier,
          builder: (context, value, child) {
            bool isPro;
            if (value == null || value.products!.isEmpty) {
              isPro = false;
            } else {
              isPro = true;
            }
            if (isPro) {
              return const Row(
                children: [
                  Text(
                    'اشتراک دارید',
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    width: Dimensions.marginExtraSmall,
                  ),
                  Icon(
                    Iconsax.crown_1_outline,
                    size: 20,
                  ),
                ],
              );
            } else {
              return ValueListenableBuilder(
                valueListenable: LocalData.storeMessageCount,
                builder: (context, value, child) {
                  if (value == 0) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            showDragHandle: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const ProductBottomSheet();
                            });
                      },
                      child: const Row(
                        children: [
                          Text(
                            'اشتراک ندارید',
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            width: Dimensions.marginExtraSmall,
                          ),
                          Icon(
                            MingCute.shopping_cart_1_line,
                            size: 20,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Row(
                      children: [
                        const Text(
                          'فرصت رایگان',
                          style: TextStyle(fontSize: 10),
                        ),
                        const SizedBox(
                          width: Dimensions.marginExtraSmall,
                        ),
                        Text(
                          value.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          width: Dimensions.marginExtraSmall,
                        ),
                        const Icon(
                          Iconsax.shopping_cart_outline,
                          size: 20,
                        ),
                      ],
                    );
                  }
                },
              );
            }
          },
        ),
        ValueListenableBuilder(
            valueListenable: LocalData.userMobileNumberNotifier,
            builder: (context, value, child) => Text(
                  value,
                  style: const TextStyle(fontSize: 10),
                ))
      ],
    ),
  );
}
