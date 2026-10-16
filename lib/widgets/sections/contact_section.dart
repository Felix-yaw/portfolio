import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../theme/portfolio_colors.dart';
import '../../utils/links.dart';
import '../glass_panel.dart';
import '../reveal.dart';
import 'section_eyebrow.dart';

/// The closing "Contact" call-to-action panel.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 72, 24, 0),
      child: Reveal(
        child: GlassPanel(
          radius: 28,
          padding: const EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SectionEyebrow(text: 'Contact'),
              const SizedBox(height: 18),
              const Text(
                'Let\u2019s build something people love.',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.2,
                  color: PortfolioColors.text,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Open to new projects and roles. Reach out and I\u2019ll get '
                'back to you.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: PortfolioColors.muted,
                ),
              ),
              const SizedBox(height: 26),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: <Widget>[
                  FilledButton.icon(
                    onPressed: () => Links.email(AppLinks.email),
                    icon: const Icon(Icons.mail_outline_rounded, size: 18),
                    label: const Text('Email me'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => Links.external(AppLinks.github),
                    icon: const Icon(Icons.code_rounded, size: 18),
                    label: const Text('GitHub'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
