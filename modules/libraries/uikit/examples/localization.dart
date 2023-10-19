import 'package:flutter/material.dart';
import 'package:uikit/localization/localizatioin.dart';

void main() => runApp(_ExampleLocalizations());

class LocaleController extends ValueNotifier<Locale> {
  LocaleController(super.value);

  void changeLocale(Locale locale) {
    if (value == locale) return;
    value = locale;
    notifyListeners();
  }
}

class _ExampleLocalizations extends StatelessWidget {
  final LocaleController _controller = LocaleController(const Locale('en'));

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (_, Locale locale, __) {
        return MaterialApp(
          localizationsDelegates: Localization.localizationDelegates,
          supportedLocales: Localization.supportedLocales,
          locale: locale,
          home: _MyHomePage(controller: _controller),
        );
      },
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage({required this.controller});

  final LocaleController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SupportedLocalesWidget(controller: controller),
            Text(Localization.of(context).greeting('Ali')),
          ],
        ),
      ),
    );
  }
}

class _SupportedLocalesWidget extends StatelessWidget {
  final List<Locale> locales = Localization.supportedLocales;
  final LocaleController controller;

  _SupportedLocalesWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: locales
          .map((locale) => _SupportedLocalesItem(
                controller: controller,
                locale: locale,
              ))
          .toList(),
    );
  }
}

class _SupportedLocalesItem extends StatelessWidget {
  const _SupportedLocalesItem({
    required this.controller,
    required this.locale,
  });

  final LocaleController controller;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.indigo)),
          onPressed: () => controller.changeLocale(locale),
          child: Text(locale.languageCode)),
    );
  }
}
