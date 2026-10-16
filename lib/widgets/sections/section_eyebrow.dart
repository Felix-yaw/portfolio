import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';

/// A small pill label that introduces a page section.
class SectionEyebrow extends StatelessWidget {
  const SectionEyebrow({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: PortfolioColors.glass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PortfolioColors.hairline),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              gradient: PortfolioColors.brand,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: PortfolioColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}
