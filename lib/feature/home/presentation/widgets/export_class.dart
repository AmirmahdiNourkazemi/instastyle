import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:instastyle/utils/show_toast.dart';
import 'package:photo_manager/photo_manager.dart';
// ignore: avoid_web_libraries_in_flutter

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

      // Save as PNG using photo_manager
      await saveImageAsPng(pngBytes);
      showToast(context, 'تصویر ذخیره شد! در گالری موجود است.');
    } catch (e) {
      print('Error: $e');
      showToast(context, 'خطا در ذخیره کردن تصویر');
    }
  }

  Future<void> saveImageAsPng(Uint8List pngBytes) async {
    final PermissionState state = await PhotoManager.requestPermissionExtend();
    if (!state.hasAccess) {
      throw Exception('Permission denied');
    }

    final AssetEntity? entity = await PhotoManager.editor.saveImage(
      filename: 'instastyle_${DateTime.now().millisecondsSinceEpoch}',
      pngBytes,
      title: 'instastyle_${DateTime.now().millisecondsSinceEpoch}.png',
      relativePath: 'Pictures/InstaStyle',
    );

    if (entity == null) {
      throw Exception('Failed to save image');
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
}