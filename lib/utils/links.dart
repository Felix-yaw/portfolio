import 'package:url_launcher/url_launcher.dart';

/// Helpers for opening external URLs and the hosted app demos.
abstract final class Links {
  static Future<void> external(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  /// Opens a demo relative to the current site origin (e.g. `demos/fitness/`).
  static Future<void> demo(String path) async {
    final Uri uri = Uri.base.resolve(path);
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  static Future<void> email(String address) =>
      external('mailto:$address');
}
