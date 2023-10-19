import 'package:flutter/material.dart';
import 'package:uikit/localization/localizatioin.dart';

void main() => runApp(_ExampleLocalizations());

class _ExampleLocalizations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      locale: const Locale('en'),
      home: const _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Localization.of(context).greeting('Ali')),
      ),
    );
  }
}
