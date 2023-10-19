import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uikit/localization/generated/l10n.dart';

class Localization extends GeneratedLocalization {
  Localization._({required this.locale});

  final Locale? locale;
  static Localization? _current;
  Localization? get current => _current;

  static LocalizationsDelegate get localizationDelegate =>
      _LocalizationDelegate(const AppLocalizationDelegate());

  static List<LocalizationsDelegate<void>> get localizationDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        Localization.localizationDelegate,
      ];

  static List<Locale> get supportedLocales =>
      const AppLocalizationDelegate().supportedLocales;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization) ??
        (throw ArgumentError('No Localization found in context'));
  }
}

final class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  _LocalizationDelegate(this._delegate);

  final AppLocalizationDelegate _delegate;

  @override
  bool isSupported(Locale locale) => _delegate.isSupported(locale);

  @override
  Future<Localization> load(Locale locale) async {
    await GeneratedLocalization.load(locale);
    return Localization._current = Localization._(locale: locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Localization> old) => false;
}
