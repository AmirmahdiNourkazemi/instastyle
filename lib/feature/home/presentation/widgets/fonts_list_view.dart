import 'package:flutter/material.dart';
import 'package:instastyle/core/localstorage/local_data.dart';
import 'package:instastyle/core/locator/locator.dart';
import 'package:instastyle/feature/auth/presentation/screen/login_screen.dart';
import 'package:instastyle/feature/product/presentation/widget/product_buttom_sheet.dart';
import 'mock_text_style.dart';

class FontsListView extends StatefulWidget {
  final ValueChanged<TextStyle> onStyleSelected;
  final ValueChanged<bool> isPro;
  const FontsListView(
      {super.key, required this.onStyleSelected, required this.isPro});

  @override
  State<FontsListView> createState() => _FontsListViewState();
}

class _FontsListViewState extends State<FontsListView> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    // Initialize or update isPaid value here if needed
  }

  bool isLocked = false;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalData.isPaid,
      builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: textStyleConfigs.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            // Check if the item is pro and user hasn't paid

            final isProItem = textStyleConfigs[index].isPro ?? false;
            // if (isProItem) {
            //   if (value != null) {
            //     if (value!.products!.length > 0) {
            //       isLocked = false;
            //     }
            //   } else {
            //     isLocked = true;
            //   }
            // }
            final isLocked = isProItem && !value;

            return GestureDetector(
              onTap: () {
                if (isLocked) {
                  if (LocalData.firstTokenNotifier.value.isEmpty) {
                    showLoginButtonSheet(context);
                  } else if (!value) {
                    showProductBottomSheet(context);
                  }
                }
                setState(() {
                  selectedIndex = index;
                });
                widget.isPro(isLocked);
                widget.onStyleSelected(textStyleConfigs[index].toTextStyle());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                        : Theme.of(context).colorScheme.onPrimary,
                    border: Border.all(
                      color: isLocked
                          ? Colors.grey
                          : Theme.of(context).colorScheme.primary,
                      width: selectedIndex == index ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textStyleConfigs[index].name,
                          style: textStyleConfigs[index].toTextStyle().copyWith(
                                color: isLocked
                                    ? Colors.grey
                                    : Theme.of(context).colorScheme.primary,
                                letterSpacing: 0.2,
                              ),
                          textDirection: TextDirection.rtl,
                        ),
                        if (isLocked)
                          Icon(Icons.lock, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
