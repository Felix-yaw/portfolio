import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/portfolio_colors.dart';

/// Animated aurora background: deep canvas with slowly drifting colour blobs.
class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key, required this.child});

  final Widget child;

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 22),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        const ColoredBox(color: PortfolioColors.background),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            final double t = _controller.value * 2 * math.pi;
            return Stack(
              children: <Widget>[
                _blob(
                  context,
                  color: PortfolioColors.violet,
                  size: 520,
                  anchor: Alignment(-0.9 + 0.25 * math.sin(t), -0.8),
                  dx: 30 * math.sin(t),
                  dy: 24 * math.cos(t),
                ),
                _blob(
                  context,
                  color: PortfolioColors.cyan,
                  size: 460,
                  anchor: Alignment(0.9, -0.4 + 0.2 * math.cos(t)),
                  dx: -28 * math.cos(t),
                  dy: 20 * math.sin(t),
                ),
                _blob(
                  context,
                  color: PortfolioColors.pink,
                  size: 480,
                  anchor: Alignment(0.1 + 0.3 * math.cos(t), 0.95),
                  dx: 22 * math.sin(t * 0.8),
                  dy: -18 * math.cos(t * 0.8),
                ),
              ],
            );
          },
        ),
        Positioned.fill(child: widget.child),
      ],
    );
  }

  Widget _blob(
    BuildContext context, {
    required Color color,
    required double size,
    required Alignment anchor,
    required double dx,
    required double dy,
  }) {
    final Size screen = MediaQuery.sizeOf(context);
    final double left = (anchor.x + 1) / 2 * screen.width - size / 2 + dx;
    final double top = (anchor.y + 1) / 2 * screen.height - size / 2 + dy;

    return Positioned(
      left: left,
      top: top,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: <Color>[
                color.withValues(alpha: 0.28),
                color.withValues(alpha: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
