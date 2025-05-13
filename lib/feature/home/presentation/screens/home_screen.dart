import 'package:flutter/material.dart';
import 'package:instastyle/core/widgets/app_bar.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_music.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_note.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_note_dark.dart';
import 'package:instastyle/feature/home/presentation/widgets/export_class.dart';
import 'package:instastyle/feature/home/presentation/widgets/select_buttons.dart';
import 'package:instastyle/feature/home/presentation/widgets/text_filled_style.dart';
import 'package:instastyle/feature/home/presentation/widgets/vertical_font_slider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/footer_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle selectedStyle = const TextStyle(fontSize: 24);
  Color selectColor = Colors.black;
  String text = 'اینجا بنویس...';
  double valueFontSize = 18;
  int isSelected = 0;
  late Export export;
  final GlobalKey _globalKey = GlobalKey();
  Future<void> storagePermission() async {
    final status = await Permission.storage.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storagePermission();
    export = Export(context: context, text: text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: appBar(title: 'InstaStyle'),
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Center(
            child: RepaintBoundary(
              key: _globalKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IphoneNoteDark(
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
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: ElevatedButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: () {
                FocusScope.of(context).unfocus();
                export.captureAndCopy(_globalKey);
              },
              label: const Text('کپی فونت'),
              icon: const Icon(Icons.copy),
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
                onSelect: isSelected,
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
    );
  }
}
