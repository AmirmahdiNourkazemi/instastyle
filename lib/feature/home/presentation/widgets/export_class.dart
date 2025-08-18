import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:super_clipboard/super_clipboard.dart'; // Add this in pubspec.yaml

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

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("📋 Copied image to clipboard!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Failed: $e")),
      );
    }
  }
}
