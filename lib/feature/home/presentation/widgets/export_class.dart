import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:instastyle/utils/show_toast.dart';
// ignore: avoid_web_libraries_in_flutter

import 'dart:ui' as ui;

class Export {
  final BuildContext context;
  final String text;

  Export({
    required this.context,
    required this.text,
  });
  Future<void> captureAndCopy(GlobalKey _globalKey) async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Mobile/Desktop
      await ImageGallerySaver.saveImage(pngBytes);
      showToast(context, 'تصویر ذخیره شد! در گالری موجود است.');
    } catch (e) {
      print('Error: $e');
      showToast(context, 'خطا در ذخیره کردن تصویر');
      
    }
  }

  Future<void> copyToClipboard() async {
    try {
      await FlutterClipboard.copy(text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('متن کپی شد')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا در کپی کردن: $e')),
      );
    }
  }

  // Future<void> saveToGallery() async {
  //   try {
  //     FocusScope.of(context).unfocus();
  //     final Uint8List? imageBytes = await _captureTextAsImage();
  //     if (imageBytes == null) {
  //       throw Exception('خطا در گرفتن تصویر');
  //     }

  //     final result = await ImageGallerySaver.saveImage(
  //       imageBytes,
  //       quality: 100,
  //       name: "instastyle_${DateTime.now().millisecondsSinceEpoch}",
  //     );

  //     if (result['isSuccess']) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('تصویر ذخیره شد')),
  //       );
  //     } else {
  //       throw Exception('خطا در ذخیره تصویر');
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('خطا: $e')),
  //     );
  //   }
  // }

  // Future<Uint8List?> _captureTextAsImage() async {
  //   try {
  //     final Uint8List? imageBytes = await screenshotController.capture();
  //     return imageBytes;
  //   } catch (e) {
  //     throw Exception('خطا در تبدیل متن به تصویر: $e');
  //   }
  // }
}
