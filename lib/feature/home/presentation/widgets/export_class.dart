import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_clipboard/flutter_image_clipboard.dart';
import 'package:instastyle/core/widgets/show_toast.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:toastification/toastification.dart';

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

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/clipboard.png');
      await file.writeAsBytes(pngBytes);
      final flutterImageClipboard = FlutterImageClipboard();
      await flutterImageClipboard.copyImageToClipboard(file);
      showToast(context, 'کپی شد', '', ToastificationType.success,
          isIconMessage: true);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("📋 کپی شد")),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Failed: $e")),
      );
    }
  }
}
