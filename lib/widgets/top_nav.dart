import 'package:flutter/material.dart';

import '../theme/portfolio_colors.dart';
import 'glass_panel.dart';

/// Sticky top navigation bar.
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
            _NavLink(label: 'About', onTap: onAbout),
            _NavLink(label: 'Work', onTap: onWork),
            _NavLink(label: 'Contact', onTap: onContact),
            const SizedBox(width: 6),
          ],
          _GitHubButton(onTap: onGitHub),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: PortfolioColors.muted,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        minimumSize: const Size(0, 40),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Text(label),
    );
  }
}

class _GitHubButton extends StatelessWidget {
  const _GitHubButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: PortfolioColors.text,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.code_rounded,
                size: 16,
                color: PortfolioColors.background,
              ),
              SizedBox(width: 8),
              Text(
                'GitHub',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: PortfolioColors.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
