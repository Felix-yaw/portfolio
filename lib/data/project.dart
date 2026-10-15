import 'package:flutter/material.dart';

import '../theme/portfolio_colors.dart';

/// A showcased project.
@immutable
class Project {
  const Project({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.tags,
    required this.demoPath,
    required this.repoUrl,
    required this.icon,
    required this.gradient,
    required this.accentLabel,
  });

  final String id;
  final String name;
  final String tagline;
  final String description;
  final List<String> tags;

  /// Relative path to the hosted web demo, e.g. `demos/ecommerce/`.
  final String demoPath;
  final String repoUrl;
  final IconData icon;
  final List<Color> gradient;

  /// Short label shown on the preview badge.
  final String accentLabel;
}

abstract final class Projects {
  static const List<Project> all = <Project>[
    Project(
      id: 'fitness',
      name: 'Pulse · Fitness Tracker',
      tagline: 'Track workouts & cheer on friends',
      description:
          'A wellness app with a weekly-goal chart, intensity tracking, a '
          'social friends feed (applaud / message) and activity logging. '
          'Strict MVVM with an in-memory repository.',
      tags: <String>['Flutter', 'MVVM', 'Provider', 'Custom charts', 'Glass UI'],
      demoPath: 'demos/fitness/',
      repoUrl: 'https://github.com/Felix-yaw/fitness-tracker',
      icon: Icons.monitor_heart_rounded,
      gradient: <Color>[PortfolioColors.violet, PortfolioColors.pink],
      accentLabel: 'Neo-brutalist',
    ),
    Project(
      id: 'expense',
      name: 'Ledger · Expense Tracker',
      tagline: 'Know where every dollar goes',
      description:
          'A personal finance app with a spending dashboard, animated bar & '
          'donut charts, category budgets, searchable expenses and a checkout '
          'style flow. MVVM + provider throughout.',
      tags: <String>['Flutter', 'MVVM', 'Provider', 'Donut chart', 'Budgets'],
      demoPath: 'demos/expense/',
      repoUrl: 'https://github.com/Felix-yaw/expense-tracker',
      icon: Icons.account_balance_wallet_rounded,
      gradient: <Color>[PortfolioColors.cyan, PortfolioColors.violet],
      accentLabel: 'Soft glass',
    ),
    Project(
      id: 'ecommerce',
      name: 'Shoply · E-commerce',
      tagline: 'A modern storefront experience',
      description:
          'A storefront with a promo carousel, category filters, product '
          'detail with variant pickers, cart with shipping/tax maths and a '
          'checkout celebration. Built for performance with const-first '
          'widgets and lazy lists.',
      tags: <String>['Flutter', 'Storefront', 'Cart & checkout', 'Animations'],
      demoPath: 'demos/ecommerce/',
      repoUrl: 'https://github.com/Felix-yaw/ecommerce-app',
      icon: Icons.shopping_bag_rounded,
      gradient: <Color>[PortfolioColors.pink, PortfolioColors.violet],
      accentLabel: 'Dribbble UI',
    ),
  ];
}
