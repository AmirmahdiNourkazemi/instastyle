import 'package:flutter/material.dart';
import 'package:instastyle/feature/home/presentation/screens/text-style/style_text_map_list.dart';
import 'package:instastyle/feature/home/presentation/style/style_map_list.dart';

class StyleListView extends StatefulWidget {
  final ValueChanged<Widget Function({required Widget child})> onWidgetSelected;
  final ValueChanged<
      Widget Function(
          {required Widget child,
          required String text,
          required double valueFontSize})> onDynamicWidgetSelected;
  const StyleListView(
      {super.key,
      required this.onWidgetSelected,
      required this.onDynamicWidgetSelected});

  @override
  State<StyleListView> createState() => _StyleListViewState();
}

class _StyleListViewState extends State<StyleListView> {
  List<String> image = [
    'assets/images/style_applemusic.png',
    'assets/images/light_iphone.png',
    'assets/images/dark_iphone.png',
    'assets/images/style_lightBox.jpg',
    'assets/images/glow.png',
    'assets/images/style_shadowLine.png',
    'assets/images/style_simple.png',
    'assets/images/glow.png',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int? selectedIndex;
  bool? isDynamicStyleSelected; // Track which list is selected

  void _resetSelections() {
    // Reset both handlers to their default states
    widget.onWidgetSelected(({required child}) => Container(child: child));
    widget.onDynamicWidgetSelected((
            {required child,
            required String text,
            required double valueFontSize}) =>
        Container(child: child));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dynamicStyle.length + dynamicTextStyle.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            // Reset if switching between list types
            if (index < dynamicStyle.length &&
                isDynamicStyleSelected == false) {
              _resetSelections();
            } else if (index >= dynamicStyle.length &&
                isDynamicStyleSelected == true) {
              _resetSelections();
            }

            selectedIndex = index;
            isDynamicStyleSelected = index < dynamicStyle.length;
          });

          if (index < dynamicStyle.length) {
            widget.onWidgetSelected(
                ({required child}) => dynamicStyle[index].builder!(child));
          } else {
            int textStyleIndex = index - dynamicStyle.length;
            widget.onDynamicWidgetSelected((
                    {required child,
                    required String text,
                    required double valueFontSize}) =>
                dynamicTextStyle[textStyleIndex].builder!(
                    child, text, valueFontSize));
          }
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
                    : Theme.of(context).colorScheme.onPrimary,
                width: selectedIndex == index ? 2 : 1,
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
