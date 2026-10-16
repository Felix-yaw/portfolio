import 'package:flutter/material.dart';

import '../../data/project.dart';
import '../../theme/portfolio_colors.dart';
import '../glass_panel.dart';
import 'project_preview.dart';
import 'project_tag.dart';

/// A hover-lifting project card with a stylised preview.
class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.onDemo,
    required this.onRepo,
  });

  final Project project;
  final VoidCallback onDemo;
  final VoidCallback onRepo;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final Project p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hover ? -8 : 0, 0),
        child: GlassPanel(
          padding: EdgeInsets.zero,
          radius: 24,
          opacity: _hover ? 0.1 : 0.06,
          borderColor: _hover ? p.gradient.first : PortfolioColors.hairline,
          onTap: widget.onDemo,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProjectPreview(project: p),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      p.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                        color: PortfolioColors.text,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      p.tagline,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: PortfolioColors.cyan,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      p.description,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: PortfolioColors.muted,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: <Widget>[
                        for (final String tag in p.tags) ProjectTag(label: tag),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        FilledButton.icon(
                          onPressed: widget.onDemo,
                          icon: const Icon(Icons.open_in_new_rounded, size: 18),
                          label: const Text('Live demo'),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: widget.onRepo,
                          icon: const Icon(Icons.code_rounded, size: 18),
                          label: const Text('Source'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
