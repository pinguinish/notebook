import 'package:flutter/material.dart';
import 'package:uikit/const/notebook_colors.dart';
import 'package:uikit/utils/extensions/theme_extension.dart';

class NotebookTheme {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: _lightNotebookColors.backgroung,
    extensions: [_lightNotebookColors],
  );

  static final _lightNotebookColors = NotebookColorsExtension(
    backgroung: Colors.white,
    primary: NotebookColors.grey,
    secondary: NotebookColors.greyBlack,
    error: Colors.redAccent,
    accent: Colors.blueAccent,
    favourite: Colors.amberAccent,
    hover: NotebookColors.greyMedium,
    hint: NotebookColors.greyLight,
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: _darkNotebookColors.backgroung,
    extensions: [_darkNotebookColors],
  );

  static final _darkNotebookColors = NotebookColorsExtension(
    backgroung: Colors.indigo[700]!,
    primary: Colors.white,
    secondary: Colors.white70,
    error: Colors.redAccent,
    accent: Colors.blueAccent,
    favourite: Colors.amberAccent,
    hover: Colors.white60,
    hint: Colors.white30,
  );
}

extension NotebookColorsThemeDataExtension on ThemeData {
  NotebookColorsExtension get colors =>
      extension<NotebookColorsExtension>() ??
      NotebookTheme._lightNotebookColors;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
