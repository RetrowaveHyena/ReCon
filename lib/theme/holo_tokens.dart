import 'package:flutter/material.dart';

/// Holo design tokens. Single source of truth for the Holo redesign.
///
/// Pure data, no widgets. Mirrors the canonical palette and typography in
/// `.design-source/recon-v2/project/variants/holo.jsx`.
class HoloColors {
  // Background.
  static const Color bg = Color(0xFF06080D);
  static const Color bg2 = Color(0xFF0A0E16);

  // Surfaces (translucent).
  static const Color panel = Color.fromRGBO(20, 28, 46, 0.6);
  static const Color panel2 = Color.fromRGBO(28, 38, 62, 0.55);
  static const Color glass = Color.fromRGBO(80, 180, 255, 0.04);

  // Lines.
  static const Color line = Color.fromRGBO(120, 180, 255, 0.12);
  static const Color line2 = Color.fromRGBO(120, 180, 255, 0.22);

  // Text.
  static const Color text = Color(0xFFDDE6F5);
  static const Color dim = Color(0xFF8090A8);
  static const Color faint = Color(0xFF4D5874);

  // Accents.
  static const Color cyan = Color(0xFF5EE2FF);
  static const Color cyanDim = Color(0xFF3A9BBF);
  static const Color magenta = Color(0xFFFF5ED5);
  static const Color amber = Color(0xFFFFB45E);
  static const Color green = Color(0xFF5EFFA8);
  static const Color red = Color(0xFFFF5E7A);
}

/// Typography tokens. Family names match `pubspec.yaml` font entries.
///
/// Holo uses three families:
///   * [displayFamily] for headings, the wordmark, big presence labels.
///   * [bodyFamily] for prose, chat bubbles, contact names.
///   * [monoFamily] for HUD labels, identifiers, timestamps, all-caps chips.
///
/// The all-caps mono label pattern uses a tracked letter-spacing scale.
/// The numeric values mirror those used inline in the Holo prototype.
class HoloType {
  static const String displayFamily = 'SpaceGrotesk';
  static const String bodyFamily = 'Inter';
  static const String monoFamily = 'JetBrainsMono';

  // Letter-spacing scale for the all-caps mono label pattern.
  static const double ls1 = 1.0;
  static const double ls15 = 1.5;
  static const double ls2 = 2.0;
  static const double ls25 = 2.5;
  static const double ls3 = 3.0;
  static const double ls4 = 4.0;
}

/// Glyphs the Holo design uses for bullets, carets, and pointers.
///
/// Sourced from holo.jsx. These are intentionally Unicode glyphs rather than
/// `Icons.*` so they sit on the text baseline alongside the mono label.
class HoloGlyphs {
  static const String diamondOutline = '◇';
  static const String diamondFilled = '◆';
  static const String triangleRight = '▸';
  // Spec named this `kCaretBlock`; preserved verbatim despite the inconsistent
  // `k` prefix relative to the other glyph constants in this class.
  static const String kCaretBlock = '▍';
}

/// Presence of a contact, mirroring Resonite's own status vocabulary.
///
/// Maps to `HlStat` in `.design-source/recon-v2/project/variants/holo.jsx`
/// at lines 84 to 98.
enum HoloPresence { online, immersed, away, private, offline }

/// Display attributes for a [HoloPresence] value.
typedef HoloPresenceStyle = ({String label, Color color, bool glow});

extension HoloPresenceStyleExt on HoloPresence {
  /// All-caps label, accent colour, and glow flag for this presence.
  ///
  /// Only [HoloPresence.immersed] glows, matching the `boxShadow` branch on
  /// `HlStat` in holo.jsx (line 94).
  HoloPresenceStyle get style {
    switch (this) {
      case HoloPresence.online:
        return (label: 'ONLINE', color: HoloColors.green, glow: false);
      case HoloPresence.immersed:
        return (label: 'IMMERSED', color: HoloColors.cyan, glow: true);
      case HoloPresence.away:
        return (label: 'AWAY', color: HoloColors.amber, glow: false);
      case HoloPresence.private:
        return (label: 'PRIVATE', color: HoloColors.magenta, glow: false);
      case HoloPresence.offline:
        return (label: 'OFFLINE', color: HoloColors.faint, glow: false);
    }
  }
}
