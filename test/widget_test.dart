import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/data/project.dart';
import 'package:portfolio/main.dart';

void main() {
  test('three projects are defined with links', () {
    expect(Projects.all.length, 3);
    for (final Project p in Projects.all) {
      expect(p.repoUrl, startsWith('https://github.com/'));
      expect(p.demoPath, startsWith('demos/'));
      expect(p.tags, isNotEmpty);
    }
  });

  testWidgets('portfolio renders the hero and projects', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());
    // The aurora background animates forever, so pump a fixed frame count.
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.text('Felix Azaglo'), findsWidgets);
    expect(find.textContaining('Flutter developer'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
