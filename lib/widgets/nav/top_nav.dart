import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';
import '../glass_panel.dart';
import 'github_button.dart';
import 'nav_link.dart';

/// The sticky top navigation bar.
class TopNav extends StatelessWidget {
  const TopNav({
    super.key,
    required this.onAbout,
    required this.onWork,
    required this.onContact,
    required this.onGitHub,
  });

  final VoidCallback onAbout;
  final VoidCallback onWork;
  final VoidCallback onContact;
  final VoidCallback onGitHub;

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 760;

    return GlassPanel(
      radius: 18,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              gradient: PortfolioColors.brand,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Felix Azaglo',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
              color: PortfolioColors.text,
            ),
          ),
          const Spacer(),
          if (!compact) ...<Widget>[
            NavLink(label: 'About', onTap: onAbout),
            NavLink(label: 'Work', onTap: onWork),
            NavLink(label: 'Contact', onTap: onContact),
            const SizedBox(width: 6),
          ],
          GitHubButton(onTap: onGitHub),
        ],
      ),
    );
  }
}
