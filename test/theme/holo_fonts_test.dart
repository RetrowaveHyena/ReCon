import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recon/theme/holo_tokens.dart';

/// Smoke test for the Holo font bundling.
///
/// The fonts are declared in `pubspec.yaml` under `flutter.fonts:` and live
/// under `assets/fonts/<Family>/`. If the pubspec entry, the on-disk path, or
/// the family name in [HoloType] drifts apart, this test fails loudly.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<int> assetSize(String path) async {
    final data = await rootBundle.load(path);
    return data.lengthInBytes;
  }

  group('Holo fonts', () {
    test('Space Grotesk asset is bundled', () async {
      final size = await assetSize(
        'assets/fonts/SpaceGrotesk/SpaceGrotesk-VariableFont_wght.ttf',
      );
      expect(size, greaterThan(50000));
    });

    test('Inter asset is bundled', () async {
      final size = await assetSize(
        'assets/fonts/Inter/Inter-VariableFont_opsz_wght.ttf',
      );
      expect(size, greaterThan(50000));
    });

    test('JetBrains Mono asset is bundled', () async {
      final size = await assetSize(
        'assets/fonts/JetBrainsMono/JetBrainsMono-VariableFont_wght.ttf',
      );
      expect(size, greaterThan(50000));
    });

    test('HoloType family names match pubspec entries', () {
      // These string literals mirror the pubspec.yaml `family:` values. If
      // either side moves, the matching is broken and Text widgets silently
      // fall back to the platform default.
      expect(HoloType.displayFamily, 'SpaceGrotesk');
      expect(HoloType.bodyFamily, 'Inter');
      expect(HoloType.monoFamily, 'JetBrainsMono');
    });
  });
}
