import 'package:flutter/material.dart';

import '../../data/project.dart';
import '../../theme/portfolio_colors.dart';
import '../../utils/links.dart';
import '../project/project_card.dart';
import '../reveal.dart';
import 'section_eyebrow.dart';

/// The "Selected work" section: a responsive grid of project cards.
class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionEyebrow(text: 'Selected work'),
          const SizedBox(height: 18),
          const Text(
            'Three apps, built end to end.',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.4,
              color: PortfolioColors.text,
            ),
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints c) {
              final int columns = c.maxWidth > 1040
                  ? 3
                  : c.maxWidth > 680
                  ? 2
                  : 1;
              const double gap = 24;
              final double cardWidth =
                  (c.maxWidth - gap * (columns - 1)) / columns;

              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: <Widget>[
                  for (int i = 0; i < Projects.all.length; i++)
                    SizedBox(
                      width: cardWidth,
                      child: Reveal(
                        key: ValueKey<String>(Projects.all[i].id),
                        delay: Duration(milliseconds: 120 * i),
                        child: ProjectCard(
                          project: Projects.all[i],
                          onDemo: () => Links.demo(Projects.all[i].demoPath),
                          onRepo: () => Links.external(Projects.all[i].repoUrl),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
