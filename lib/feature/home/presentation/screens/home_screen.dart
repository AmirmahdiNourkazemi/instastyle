import 'package:flutter/material.dart';
import 'package:instastyle/core/widgets/app_bar.dart';
import 'package:instastyle/feature/home/presentation/widgets/select_buttons.dart';

import '../widgets/footer_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle selectedStyle = const TextStyle(fontSize: 24);
  String text = 'متن خود را وارد کنید';
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: appBar(title: 'InstaStyle'),
        body: Stack(
          children: [
            Center(
              child: TextField(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                // style: Theme.of(context).textTheme.headlineLarge,
                style: selectedStyle,
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
                maxLines: null,
                decoration: InputDecoration(
                  hintText: text,
                  hintStyle: selectedStyle,
                  border: InputBorder.none,
                ),
                // decoration: InputDecoration(

                //   hintStyle: Theme.of(context).textTheme.headlineLarge,
                //   border: InputBorder.none,
                // ),
              ),
            ),
            Visibility(
              visible: isSelected,
              child: Positioned(
                  bottom: 30,
                  child: SelectButtons(
                    onSelect: isSelected,
                    onStyleSelected: (style) {
                      setState(() {
                        selectedStyle = style;
                      });
                    },
                  )),
            ),
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
