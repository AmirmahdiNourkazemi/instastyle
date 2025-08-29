import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instastyle/core/widgets/show_toast.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:toastification/toastification.dart'; // Add this in pubspec.yaml

class Export {
  final BuildContext context;
  final String text;
  Export({required this.context, required this.text});

  Future<void> captureAndCopy(GlobalKey globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0); // high quality
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Copy image to clipboard using super_clipboard
      final item = DataWriterItem();
      item.add(Formats.png(pngBytes));
      await ClipboardWriter.instance.write([item]);

      showToast(context, 'کپی شد', '', ToastificationType.success,
          isIconMessage: true);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("📋 کپی شد")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Failed: $e")),
      );
    }
  }
}
