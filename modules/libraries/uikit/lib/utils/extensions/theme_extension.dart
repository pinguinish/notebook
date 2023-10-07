import 'package:flutter/material.dart';

class NotebookColorsExtension extends ThemeExtension<NotebookColorsExtension> {
  NotebookColorsExtension({
    required this.backgroung,
    required this.primary,
    required this.secondary,
    required this.error,
    required this.accent,
    required this.favourite,
    required this.hover,
    required this.hint,
  });

  final Color backgroung;
  final Color primary;
  final Color secondary;
  final Color error;
  final Color accent;
  final Color favourite;
  final Color hover;
  final Color hint;

  @override
  ThemeExtension<NotebookColorsExtension> copyWith(
      {Color? backgroung,
      Color? primary,
      Color? secondary,
      Color? error,
      Color? accent,
      Color? favourite,
      Color? hover,
      Color? hint}) {
    return NotebookColorsExtension(
      backgroung: backgroung ?? this.backgroung,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      accent: accent ?? this.accent,
      favourite: favourite ?? this.favourite,
      hover: hover ?? this.hover,
      hint: hint ?? this.hint,
    );
  }

  @override
  ThemeExtension<NotebookColorsExtension> lerp(
    covariant ThemeExtension<NotebookColorsExtension>? other,
    double t,
  ) {
    if (other is! NotebookColorsExtension) return this;

    return NotebookColorsExtension(
      backgroung: Color.lerp(backgroung, other.backgroung, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      favourite: Color.lerp(favourite, other.favourite, t)!,
      hover: Color.lerp(hover, other.hover, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
    );
  }
}
