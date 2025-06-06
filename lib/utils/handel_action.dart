import 'package:flutter/material.dart';
import 'package:instastyle/core/localstorage/local_data.dart';
import 'package:instastyle/core/widgets/show_toast.dart';
import 'package:toastification/toastification.dart';

import '../core/locator/locator.dart';
import '../feature/product/presentation/widget/product_buttom_sheet.dart';
import '../feature/status/data/model/status_model.dart';

class HandelAction {
  static Future<int?> freeUsage() async {
    return await locator<LocalData>().loadStoreMessageCount();
  }

  static Future<StatusModel?> getStatus() async {
    return await locator<LocalData>().loadStatus();
  }

  static void handleStatusUser({
    required BuildContext context,
    required VoidCallback? onTap,
    bool? navigateBack = false,
  }) async {
    StatusModel? value = await getStatus();
    if (value?.products?.isEmpty ?? true) {
      freeUsage();
      if (LocalData.storeMessageCount.value! > 0) {
        onTap?.call();
      } else {
        showToast(
          context,
          'خرید اشتراک',
          'برای استفاده لطفا اشتراک تهیه کنید',
          ToastificationType.warning,
        );
        // Navigator.of(context).pop();

        showModalBottomSheet(
          showDragHandle: true,
          context: context,
          builder: (BuildContext context) {
            return const ProductBottomSheet();
          },
        );
      }
    } else {
      onTap?.call();
    }
  }
//  static void handleStatusChatBot({
//     required BuildContext context,
//     required VoidCallback? onTap,
//     bool? navigateBack = false,
//   }) async {
//     StatusModel? value = await getStatus();
//     if (value?.products?.isEmpty ?? true) {
//       freeChat();
//       if (LocalData.storeMessageCount.value! > 0) {
//         onTap?.call();
//       } else {
//         if (navigateBack!) {
//           showToast(
//             context,
//             'خرید اشتراک',
//             'برای استفاده لطفا اشتراک تهیه کنید',
//             ToastificationType.warning,
//           );
//           Navigator.of(context).pop();
//         }
//         showModalBottomSheet(
//           showDragHandle: true,
//           backgroundColor: Theme.of(context).colorScheme.onPrimary,
//           context: context,
//           builder: (BuildContext context) {
//             return const ProductBottomSheet();
//           },
//         );
//       }
//     } else {
//       onTap?.call();
//     }
//   }
//   static void handleReportUser({
//     required BuildContext context,
//     required VoidCallback? onTap,
//     bool? navigateBack = false,
//   }) async {
//     StatusModel? value = await getStatus();
//     if (value?.products?.isEmpty ?? true) {
//       showModalBottomSheet(
//         showDragHandle: true,
//         backgroundColor: Theme.of(context).colorScheme.onPrimary,
//         context: context,
//         builder: (BuildContext context) {
//           return const ProductBottomSheet();
//         },
//       );
//     } else {
//       onTap?.call();
//     }
//   }
// }
}
