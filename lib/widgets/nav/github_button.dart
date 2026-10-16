import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';

/// The solid "GitHub" button shown at the end of the top navigation bar.
class GitHubButton extends StatelessWidget {
  const GitHubButton({super.key, required this.onTap});

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
