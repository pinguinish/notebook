import 'package:flutter/material.dart';
import 'package:uikit/theme.dart';

void main(List<String> args) => runApp(
      _AppTheme(controller: ThemeController(ThemeMode.system)),
    );

class _AppTheme extends StatelessWidget {
  const _AppTheme({required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: controller,
      builder: (_, theme, widget) {
        return MaterialApp(
          themeMode: theme,
          theme: NotebookTheme.light,
          darkTheme: NotebookTheme.dark,
          home: Scaffold(
            body: _ExampleWidget(
              controller: controller,
            ),
          ),
        );
      },
    );
  }
}

class _ExampleWidget extends StatelessWidget {
  const _ExampleWidget({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: context.theme.colors.primary,
          ),
          OutlinedButton(
            onPressed: () {
              controller.changeTheme();
            },
            child: const Text("Click on me"),
          ),
        ],
      ),
    );
  }
}

class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController(super.value);

  void changeTheme() {
    value = ThemeMode.dark == value ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
