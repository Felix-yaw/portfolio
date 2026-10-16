import 'package:flutter/material.dart';

import '../../data/project.dart';
import '../../theme/portfolio_colors.dart';
import '../glass_panel.dart';
import '../reveal.dart';
import 'mini_project.dart';

/// A frosted panel previewing the three selected apps.
class HeroVisual extends StatelessWidget {
  const HeroVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return Reveal(
      delay: const Duration(milliseconds: 150),
      child: GlassPanel(
        radius: 28,
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: PortfolioColors.lime,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Selected apps',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: PortfolioColors.muted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (final Project p in Projects.all) ...<Widget>[
              MiniProject(project: p),
              if (p != Projects.all.last) const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}
