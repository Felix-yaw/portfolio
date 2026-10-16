import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';
import 'section_eyebrow.dart';
import 'skill_chip.dart';

/// The "About" section: a short bio followed by a grid of skills.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const List<String> _skills = <String>[
    'Flutter',
    'Dart',
    'MVVM',
    'Provider',
    'REST APIs',
    'Firebase',
    'UI / UX',
    'Motion',
    'CustomPaint',
    'CI / CD',
    'Git',
    'Responsive design',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionEyebrow(text: 'About'),
          const SizedBox(height: 18),
          const Text(
            'Engineer with a designer\u2019s eye.',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.4,
              color: PortfolioColors.text,
            ),
          ),
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: const Text(
              'I build cross-platform products with Flutter — from architecture '
              'and state management to pixel-perfect, animated interfaces. I '
              'care about readable, tested code and interfaces that feel alive. '
              'These three apps share a common MVVM foundation with '
              'feature-grouped widgets, selective rebuilds and custom-drawn '
              'charts.',
              style: TextStyle(
                fontSize: 15,
                height: 1.75,
                color: PortfolioColors.muted,
              ),
            ),
          ),
          const SizedBox(height: 26),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              for (final String skill in _skills) SkillChip(label: skill),
            ],
          ),
        ],
      ),
    );
  }
}
