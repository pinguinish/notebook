import 'package:flutter/widgets.dart';

abstract final class NotebookColors {
  static const grey = _Grey();
  static const blue = Color(0xFF2383E2);
  static const orange = Color(0xFFF6C050);
  static const red = Color(0xFFEB5757);
}

final class _Grey {
  const _Grey();
  final normal = const Color(0xFFE2E2E1);
  final light = const Color(0xFFE1E1E0);
  final medium = const Color(0xFFB9B8B6);
  final black = const Color(0xFFA3A29E);
}
