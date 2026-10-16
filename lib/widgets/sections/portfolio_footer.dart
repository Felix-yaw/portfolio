import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';

/// The page footer with the copyright line.
class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 0),
      child: const Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '\u00A9 2026 Felix Azaglo',
              style: TextStyle(fontSize: 13, color: PortfolioColors.faint),
            ),
          ),
          Text(
            'Built with Flutter Web',
            style: TextStyle(fontSize: 13, color: PortfolioColors.faint),
          ),
        ],
      ),
    );
  }
}
