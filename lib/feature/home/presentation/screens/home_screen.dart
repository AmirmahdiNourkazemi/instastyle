import 'package:flutter/material.dart';
import 'package:instastyle/core/widgets/app_bar.dart';
import 'package:instastyle/feature/home/presentation/widgets/select_buttons.dart';
import 'package:instastyle/feature/home/presentation/widgets/text_filled_style.dart';
import 'package:instastyle/feature/home/presentation/widgets/vertical_font_slider.dart';

import '../widgets/footer_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle selectedStyle = const TextStyle(fontSize: 24);
  Color selectColor =  Colors.black;
  String text = 'اینجا بنویس...';
  double valueFontSize = 18;
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: appBar(title: 'InstaStyle'),
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: StyledTextInput(
                   
                    textStyle: selectedStyle.copyWith(
                      fontSize: valueFontSize,
                      color: selectColor,
                    ),
                    onTextChanged: (value) {
                      setState(() {
                        text = value;
                      });
                    }),
              ),
            ),
            VerticalFontSlider(
              initialSize: valueFontSize,
              onSizeChanged: (value) {
                setState(() {
                  valueFontSize = value;
                });
              },
            ),
            Positioned(
                bottom: 8,
                child: SelectButtons(
                  onSelect:isSelected ,
                  onColorSelected: (value) {
                    setState(() {
                      selectColor = value;
                    });
                  },
                  onStyleSelected: (style) {
                    setState(() {
                      selectedStyle = style;
                    });
                  },
                )),
          ],
        ),
        persistentFooterAlignment: AlignmentDirectional.bottomCenter,
        persistentFooterButtons: [
          FooterButtons(
            onSelect: (value) {
              setState(() {
                isSelected = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
