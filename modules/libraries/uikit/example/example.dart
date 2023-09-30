import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const AppExample());

class AppExample extends StatelessWidget {
  const AppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExampleContent(),
    );
  }
}

class ExampleContent extends StatelessWidget {
  const ExampleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Hello"),
      ],
    );
  }
}