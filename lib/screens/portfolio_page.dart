import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../utils/links.dart';
import '../widgets/aurora_background.dart';
import '../widgets/nav/top_nav.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/content_width.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/portfolio_footer.dart';
import '../widgets/sections/work_section.dart';

/// The single-page portfolio.
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scroll = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _goTo(GlobalKey key) {
    final BuildContext? context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuroraBackground(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: ContentWidth(
                  child: TopNav(
                    onAbout: () => _goTo(_aboutKey),
                    onWork: () => _goTo(_workKey),
                    onContact: () => _goTo(_contactKey),
                    onGitHub: () => Links.external(AppLinks.github),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scroll,
                  child: ContentWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeroSection(
                          onWork: () => _goTo(_workKey),
                          onGithub: () => Links.external(AppLinks.github),
                        ),
                        AboutSection(key: _aboutKey),
                        WorkSection(key: _workKey),
                        ContactSection(key: _contactKey),
                        const PortfolioFooter(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
