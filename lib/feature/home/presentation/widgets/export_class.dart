import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class Export {
  final BuildContext context;
  final ScreenshotController screenshotController;
  final String text;

  Export({
    required this.context,
    required this.screenshotController,
    required this.text,
  });

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

  Future<void> saveToGallery() async {
    try {
      FocusScope.of(context).unfocus();
      final Uint8List? imageBytes = await _captureTextAsImage();
      if (imageBytes == null) {
        throw Exception('خطا در گرفتن تصویر');
      }

      final result = await ImageGallerySaver.saveImage(
        imageBytes,
        quality: 100,
        name: "instastyle_${DateTime.now().millisecondsSinceEpoch}",
      );

      if (result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تصویر ذخیره شد')),
        );
      } else {
        throw Exception('خطا در ذخیره تصویر');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا: $e')),
      );
    }
  }

  Future<Uint8List?> _captureTextAsImage() async {
    try {
      final Uint8List? imageBytes = await screenshotController.capture();
      return imageBytes;
    } catch (e) {
      throw Exception('خطا در تبدیل متن به تصویر: $e');
    }
  }
}
