import 'package:flutter/material.dart';
import 'package:recon/theme/holo_tokens.dart';

/// Visual smoke test for the Holo typography stack.
///
/// Renders all three families ([HoloType.displayFamily], [HoloType.bodyFamily],
/// [HoloType.monoFamily]) at every supported weight (400/500/600/700) plus a
/// presence-pill row driven by [HoloPresence] so glyphs and tokens are exercised
/// end-to-end. Use via the alternate entry point in `lib/main_holo_preview.dart`:
///
///     flutter run -d chrome -t lib/main_holo_preview.dart
class HoloPreview extends StatelessWidget {
  const HoloPreview({super.key});

  static const List<FontWeight> _weights = [
    FontWeight.w400,
    FontWeight.w500,
    FontWeight.w600,
    FontWeight.w700,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HoloColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(48, 36, 48, 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              const SizedBox(height: 32),
              _FamilyBlock(
                title: 'DISPLAY',
                family: HoloType.displayFamily,
                sample: 'Stay linked to your worlds.',
              ),
              const SizedBox(height: 28),
              _FamilyBlock(
                title: 'BODY',
                family: HoloType.bodyFamily,
                sample:
                    'Track contacts and sessions, send invites, message friends.',
              ),
              const SizedBox(height: 28),
              _FamilyBlock(
                title: 'MONO',
                family: HoloType.monoFamily,
                sample: 'CLOUDX-API 23ms - SIGNAL-R OK - U-58a3-c12f-ea44',
              ),
              const SizedBox(height: 36),
              const _PresencePillRow(),
              const SizedBox(height: 28),
              const _GlyphRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${HoloGlyphs.diamondOutline} HOLO TYPOGRAPHY',
          style: const TextStyle(
            fontFamily: HoloType.monoFamily,
            color: HoloColors.cyan,
            fontSize: 11,
            letterSpacing: HoloType.ls3,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Visual font smoke test',
          style: TextStyle(
            fontFamily: HoloType.displayFamily,
            color: HoloColors.text,
            fontSize: 32,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Three families, four weights each, plus glyph + presence row.',
          style: TextStyle(
            fontFamily: HoloType.bodyFamily,
            color: HoloColors.dim,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _FamilyBlock extends StatelessWidget {
  const _FamilyBlock({
    required this.title,
    required this.family,
    required this.sample,
  });

  final String title;
  final String family;
  final String sample;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        color: HoloColors.panel,
        border: Border.all(color: HoloColors.line2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${HoloGlyphs.diamondFilled} $title',
                style: const TextStyle(
                  fontFamily: HoloType.monoFamily,
                  color: HoloColors.cyan,
                  fontSize: 10,
                  letterSpacing: HoloType.ls25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                family,
                style: const TextStyle(
                  fontFamily: HoloType.monoFamily,
                  color: HoloColors.faint,
                  fontSize: 10,
                  letterSpacing: HoloType.ls1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          for (final w in HoloPreview._weights) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    'w${w.value}',
                    style: const TextStyle(
                      fontFamily: HoloType.monoFamily,
                      color: HoloColors.faint,
                      fontSize: 10,
                      letterSpacing: HoloType.ls1,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    sample,
                    style: TextStyle(
                      fontFamily: family,
                      color: HoloColors.text,
                      fontSize: 18,
                      fontWeight: w,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _PresencePillRow extends StatelessWidget {
  const _PresencePillRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: [
        for (final p in HoloPresence.values) _PresencePill(p),
      ],
    );
  }
}

class _PresencePill extends StatelessWidget {
  const _PresencePill(this.presence);

  final HoloPresence presence;

  @override
  Widget build(BuildContext context) {
    final s = presence.style;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: s.color),
        boxShadow: s.glow
            ? [BoxShadow(color: s.color.withValues(alpha: 0.4), blurRadius: 12)]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: 0.785, // 45deg
            child: Container(width: 6, height: 6, color: s.color),
          ),
          const SizedBox(width: 8),
          Text(
            s.label,
            style: TextStyle(
              fontFamily: HoloType.monoFamily,
              color: s.color,
              fontSize: 10,
              letterSpacing: HoloType.ls15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _GlyphRow extends StatelessWidget {
  const _GlyphRow();

  static const _glyphs = [
    ('diamondOutline', HoloGlyphs.diamondOutline),
    ('diamondFilled', HoloGlyphs.diamondFilled),
    ('triangleRight', HoloGlyphs.triangleRight),
    ('kCaretBlock', HoloGlyphs.kCaretBlock),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        color: HoloColors.panel2,
        border: Border.all(color: HoloColors.line2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '${HoloGlyphs.diamondFilled} GLYPHS',
            style: TextStyle(
              fontFamily: HoloType.monoFamily,
              color: HoloColors.cyan,
              fontSize: 10,
              letterSpacing: HoloType.ls25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 32,
            runSpacing: 12,
            children: [
              for (final (name, glyph) in _glyphs)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      glyph,
                      style: const TextStyle(
                        color: HoloColors.cyan,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: HoloType.monoFamily,
                        color: HoloColors.dim,
                        fontSize: 11,
                        letterSpacing: HoloType.ls1,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
