import 'package:flutter/material.dart';

import '../../data/project.dart';

/// The stylised browser-window preview shown at the top of a [ProjectCard].
class ProjectPreview extends StatelessWidget {
  const ProjectPreview({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: project.gradient,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Faux window chrome.
            Positioned(
              top: 14,
              left: 16,
              child: Row(
                children: <Widget>[
                  for (final double o in <double>[0.9, 0.6, 0.4])
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: o),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  project.accentLabel,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                ),
                child: Icon(project.icon, color: Colors.white, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
