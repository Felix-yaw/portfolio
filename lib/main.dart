import 'package:flutter/material.dart';

import 'screens/portfolio_page.dart';
import 'theme/portfolio_theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Felix Azaglo · Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: PortfolioTheme.dark(),
      home: const PortfolioPage(),
    );
  }
}
