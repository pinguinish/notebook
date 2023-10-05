import 'dart:async';

import 'package:flutter/material.dart';

void main() => runZonedGuarded(
      () => runApp(const MainApp()),
      (error, stack) => AppError(
        error: error,
        stackTrace: stack,
      ),
    );

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Notebook"),
        ),
      ),
    );
  }
}

/// [AppError] is displayed when an error has occured during initialization
class AppError extends StatelessWidget {
  const AppError({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}
