import 'dart:math' show Random;
import 'dart:ui' show Color;

enum ConfigDevice { smallPhone, mediumPhone, largePhone, tablet }

class Helpers {
  static ConfigDevice getConfigDevice(double width) {
    if (width < 360) {
      return ConfigDevice.smallPhone;
    } else if (width < 480) {
      return ConfigDevice.mediumPhone;
    } else if (width < 720) {
      return ConfigDevice.largePhone;
    } else {
      return ConfigDevice.tablet;
    }
  }

  static String getInitials(
    String? fullName, {
    int maxLetters = 2,
    String separator = '',
  }) {
    if (fullName == null) return '';
    final parts = fullName
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();

    if (parts.isEmpty) return '';

    final initials = <String>[];
    for (var i = 0; i < parts.length && initials.length < maxLetters; i++) {
      initials.add(parts[i][0].toUpperCase());
    }

    return initials.join(separator);
  }

  static Color getReadableRandomColor() {
    final random = Random();
    var r = random.nextInt(256);
    var g = random.nextInt(256);
    var b = random.nextInt(256);

    final brightness = (r * 299 + g * 587 + b * 114) / 1000;

    // Si el color es muy claro, reducimos su brillo
    if (brightness > 180) {
      r = (r * 0.7).toInt();
      g = (g * 0.7).toInt();
      b = (b * 0.7).toInt();
    }

    return Color.fromRGBO(r, g, b, 1);
  }
}
