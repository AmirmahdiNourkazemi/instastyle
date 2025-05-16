import 'package:flutter/material.dart';
import 'package:instastyle/feature/home/presentation/screens/text-style/style_text_map_list.dart';
import 'package:instastyle/feature/home/presentation/style/style_map_list.dart';

import 'mock_text_style.dart';

class TextStyleListView extends StatefulWidget {
  final ValueChanged<
      Widget Function(
          {required Widget child,
          required String text,
          required double valueFontSize})> onDynamicWidgetSelected;
  const TextStyleListView({super.key, required this.onDynamicWidgetSelected});

  @override
  State<TextStyleListView> createState() => _TextStyleListViewState();
}

class _TextStyleListViewState extends State<TextStyleListView> {
  List<String> image = [
    'assets/images/style_applemusic.png',
    'assets/images/light_iphone.png',
    'assets/images/dark_iphone.png',
    'assets/images/style_lightBox.jpg',
    'assets/images/glow.png',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dynamicTextStyle.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
         
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.1),
              border: Border.all(
                color: selectedIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.inversePrimary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(image[index])),
            ),
          ),
        ),
      ),
    );
  }
}
