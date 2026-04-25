import 'package:flutter/material.dart';
import 'package:recon/dev/holo_preview.dart';

/// Alternate entry point used to visually validate the Holo design tokens
/// and font bundle without booting the full app (auth, hub, hive, etc.).
///
/// Run with:
///
///     flutter run -d chrome -t lib/main_holo_preview.dart
///
/// or against a headless web server for screenshot automation:
///
///     flutter run -d web-server --web-port 12345 -t lib/main_holo_preview.dart
void main() {
  runApp(
    const MaterialApp(
      title: 'ReCon - Holo preview',
      debugShowCheckedModeBanner: false,
      home: HoloPreview(),
    ),
  );
}
