import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instastyle/core/widgets/app_bar.dart';
import 'package:instastyle/core/widgets/dynamic_widget.dart';
import 'package:instastyle/feature/home/presentation/widgets/select_buttons.dart';
import 'package:instastyle/feature/home/presentation/widgets/text_filled_style.dart';
import 'package:instastyle/feature/home/presentation/widgets/vertical_font_slider.dart';

import '../widgets/footer_buttons.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // ✅ For RenderRepaintBoundary

// Only import dart:html if on web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _globalKey = GlobalKey();

  TextStyle selectedStyle = const TextStyle(fontSize: 24);
  Color selectColor = Colors.black;
  String text = 'اینجا بنویس...';
  double valueFontSize = 18;
  int isSelected = 0;

  Future<void> _captureAndCopy() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      if (kIsWeb) {
        // Web: create a download link
        final blob = html.Blob([pngBytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);

        final anchor = html.AnchorElement(href: url)
          ..setAttribute('download', 'text_image.png')
          ..click();

        html.Url.revokeObjectUrl(url);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('عکس ذخیره شد! لطفاً آن را باز یا دانلود کنید.')),
        );
      } else {
        // Mobile/Desktop
        await ImageGallerySaver.saveImage(pngBytes);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تصویر ذخیره شد! در گالری موجود است.')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('خطایی رخ داد.')),
      );
    }
  }

  Map<String, dynamic> dynamicParentJson = {
    "type": "Column",
    "children": [
      {
        "type": "Row",
        "children": [
          {"type": "Icon", "icon": "Icons.star", "color": "#FFFFFF"},
          {"type": "Icon", "icon": "Icons.favorite", "color": "#FFFFFF"},
          {"type": "Icon", "icon": "Icons.share", "color": "#FFFFFF"},
        ]
      },
      {
        "type": "Container",
        "color": "#000000",
        "width": 300,
        "height": 300,
        "borderRadius": 20,
        "child": {
          "type": "StyledTextInput" // <-- Place for your StyledTextInput
        }
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InstaStyle'),
          actions: [
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: _captureAndCopy,
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RepaintBoundary(
                  // 🖼️ Wrap your styled text
                  key: _globalKey,
                  child: buildDynamicWidget(
                    dynamicParentJson,
                    StyledTextInput(
                      textStyle: selectedStyle.copyWith(
                        fontSize: valueFontSize,
                        color: selectColor,
                      ),
                      onTextChanged: (value) {
                        setState(() {
                          text = value;
                        });
                      },
                    ),
                  ),
                ),
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
              ),
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
