import 'package:flutter/material.dart';

import '../../data/project.dart';
import '../../theme/portfolio_colors.dart';

/// A compact row summarising a single project inside [HeroVisual].
class MiniProject extends StatelessWidget {
  const MiniProject({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: project.gradient),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(project.icon, color: Colors.white, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                project.name.split(' · ').first,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: PortfolioColors.text,
                ),
              ),
              Text(
                project.tagline,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: PortfolioColors.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
