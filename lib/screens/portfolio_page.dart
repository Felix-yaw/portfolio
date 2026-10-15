import 'package:flutter/material.dart';

import '../data/project.dart';
import '../theme/portfolio_colors.dart';
import '../utils/links.dart';
import '../widgets/aurora_background.dart';
import '../widgets/glass_panel.dart';
import '../widgets/gradient_text.dart';
import '../widgets/project_card.dart';
import '../widgets/reveal.dart';
import '../widgets/top_nav.dart';

const String _github = 'https://github.com/Felix-yaw';
const String _email = 'felix-azaglo@quantumgroup.gh';

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
                child: _Constrained(
                  child: TopNav(
                    onAbout: () => _goTo(_aboutKey),
                    onWork: () => _goTo(_workKey),
                    onContact: () => _goTo(_contactKey),
                    onGitHub: () => Links.external(_github),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scroll,
                  child: _Constrained(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _Hero(
                          onWork: () => _goTo(_workKey),
                          onGithub: () => Links.external(_github),
                        ),
                        _About(key: _aboutKey),
                        _Work(key: _workKey),
                        _Contact(key: _contactKey),
                        const _Footer(),
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

class _Constrained extends StatelessWidget {
  const _Constrained({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: child,
      ),
    );
  }
}

// ───────────────────────────────── Hero ─────────────────────────────────

class _Hero extends StatelessWidget {
  const _Hero({required this.onWork, required this.onGithub});

  final VoidCallback onWork;
  final VoidCallback onGithub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 64, 24, 40),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints c) {
          final bool wide = c.maxWidth > 900;
          final Widget text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const _Eyebrow(text: 'Portfolio · 2026'),
              const SizedBox(height: 20),
              GradientText(
                'Felix Azaglo',
                style: TextStyle(
                  fontSize: wide ? 68 : 46,
                  fontWeight: FontWeight.w800,
                  letterSpacing: wide ? -3 : -2,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Flutter developer crafting fast, beautiful cross-platform apps.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: PortfolioColors.muted,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'I design and build production-ready products with a strong '
                'focus on clean architecture (MVVM), delightful motion and '
                'performance. Below are three apps I have shipped end to end — '
                'try their live demos.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.7,
                  color: PortfolioColors.muted,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: <Widget>[
                  FilledButton.icon(
                    onPressed: onWork,
                    icon: const Icon(Icons.arrow_downward_rounded, size: 18),
                    label: const Text('View my work'),
                  ),
                  OutlinedButton.icon(
                    onPressed: onGithub,
                    icon: const Icon(Icons.code_rounded, size: 18),
                    label: const Text('GitHub'),
                  ),
                ],
              ),
            ],
          );

          final Widget visual = const _HeroVisual();

          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text,
                const SizedBox(height: 44),
                visual,
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 6, child: text),
              const SizedBox(width: 56),
              const Expanded(flex: 5, child: _HeroVisual()),
            ],
          );
        },
      ),
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return Reveal(
      delay: const Duration(milliseconds: 150),
      child: GlassPanel(
        radius: 28,
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: PortfolioColors.lime,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Selected apps',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: PortfolioColors.muted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (final Project p in Projects.all) ...<Widget>[
              _MiniProject(project: p),
              if (p != Projects.all.last) const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _MiniProject extends StatelessWidget {
  const _MiniProject({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: project.gradient),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(project.icon, color: Colors.white, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                project.name.split(' · ').first,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: PortfolioColors.text,
                ),
              ),
              Text(
                project.tagline,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: PortfolioColors.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────── About ─────────────────────────────────

class _About extends StatelessWidget {
  const _About({super.key});

  static const List<String> _skills = <String>[
    'Flutter',
    'Dart',
    'MVVM',
    'Provider',
    'REST APIs',
    'Firebase',
    'UI / UX',
    'Motion',
    'CustomPaint',
    'CI / CD',
    'Git',
    'Responsive design',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const _Eyebrow(text: 'About'),
          const SizedBox(height: 18),
          const Text(
            'Engineer with a designer\u2019s eye.',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.4,
              color: PortfolioColors.text,
            ),
          ),
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: const Text(
              'I build cross-platform products with Flutter — from architecture '
              'and state management to pixel-perfect, animated interfaces. I '
              'care about readable, tested code and interfaces that feel alive. '
              'These three apps share a common MVVM foundation with '
              'feature-grouped widgets, selective rebuilds and custom-drawn '
              'charts.',
              style: TextStyle(
                fontSize: 15,
                height: 1.75,
                color: PortfolioColors.muted,
              ),
            ),
          ),
          const SizedBox(height: 26),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              for (final String skill in _skills) _Skill(label: skill),
            ],
          ),
        ],
      ),
    );
  }
}

class _Skill extends StatelessWidget {
  const _Skill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: PortfolioColors.glass,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: PortfolioColors.hairline),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: PortfolioColors.text,
        ),
      ),
    );
  }
}

// ───────────────────────────────── Work ─────────────────────────────────

class _Work extends StatelessWidget {
  const _Work({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const _Eyebrow(text: 'Selected work'),
          const SizedBox(height: 18),
          const Text(
            'Three apps, built end to end.',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.4,
              color: PortfolioColors.text,
            ),
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints c) {
              final int columns = c.maxWidth > 1040
                  ? 3
                  : c.maxWidth > 680
                  ? 2
                  : 1;
              const double gap = 24;
              final double cardWidth =
                  (c.maxWidth - gap * (columns - 1)) / columns;

              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: <Widget>[
                  for (int i = 0; i < Projects.all.length; i++)
                    SizedBox(
                      width: cardWidth,
                      child: Reveal(
                        key: ValueKey<String>(Projects.all[i].id),
                        delay: Duration(milliseconds: 120 * i),
                        child: ProjectCard(
                          project: Projects.all[i],
                          onDemo: () => Links.demo(Projects.all[i].demoPath),
                          onRepo: () => Links.external(Projects.all[i].repoUrl),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────── Contact ────────────────────────────────

class _Contact extends StatelessWidget {
  const _Contact({super.key});

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
              const _Eyebrow(text: 'Contact'),
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
                    onPressed: () => Links.email(_email),
                    icon: const Icon(Icons.mail_outline_rounded, size: 18),
                    label: const Text('Email me'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => Links.external(_github),
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

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 0),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Text(
              '\u00A9 2026 Felix Azaglo',
              style: TextStyle(fontSize: 13, color: PortfolioColors.faint),
            ),
          ),
          Text(
            'Built with Flutter Web',
            style: TextStyle(
              fontSize: 13,
              color: PortfolioColors.faint,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────── Shared ─────────────────────────────────

class _Eyebrow extends StatelessWidget {
  const _Eyebrow({required this.text});

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
