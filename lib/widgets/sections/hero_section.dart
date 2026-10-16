import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';
import '../gradient_text.dart';
import 'hero_visual.dart';
import 'section_eyebrow.dart';

/// The first screen: headline, intro copy and call-to-action buttons.
class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onWork,
    required this.onGithub,
  });

  final VoidCallback onWork;
  final VoidCallback onGithub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 64, 24, 40),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints c) {
          final bool wide = c.maxWidth > 900;
          final Widget text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SectionEyebrow(text: 'Portfolio · 2026'),
              const SizedBox(height: 20),
              GradientText(
                'Felix Azaglo',
                style: TextStyle(
                  fontSize: wide ? 68 : 46,
                  fontWeight: FontWeight.w800,
                  letterSpacing: wide ? -3 : -2,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Flutter developer crafting fast, beautiful cross-platform apps.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: PortfolioColors.muted,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'I design and build production-ready products with a strong '
                'focus on clean architecture (MVVM), delightful motion and '
                'performance. Below are three apps I have shipped end to end — '
                'try their live demos.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.7,
                  color: PortfolioColors.muted,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: <Widget>[
                  FilledButton.icon(
                    onPressed: onWork,
                    icon: const Icon(Icons.arrow_downward_rounded, size: 18),
                    label: const Text('View my work'),
                  ),
                  OutlinedButton.icon(
                    onPressed: onGithub,
                    icon: const Icon(Icons.code_rounded, size: 18),
                    label: const Text('GitHub'),
                  ),
                ],
              ),
            ],
          );

          const Widget visual = HeroVisual();

          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text,
                const SizedBox(height: 44),
                visual,
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 6, child: text),
              const SizedBox(width: 56),
              const Expanded(flex: 5, child: HeroVisual()),
            ],
          );
        },
      ),
    );
  }
}
