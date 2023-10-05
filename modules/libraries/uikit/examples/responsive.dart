import 'package:flutter/material.dart';
import 'package:uikit/main.dart';

void main() => runApp(const UIKitResponsiveExample());

class UIKitResponsiveExample extends StatelessWidget {
  const UIKitResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Responsive(
          small: (_) => const Center(
            child: Text("Small"),
          ),
          medium: (_) => Row(
            children: [
              Container(
                color: Colors.amber[900],
                height: double.infinity,
                width: 70,
              ),
              const Expanded(
                child: Center(
                  child: Text("Medium"),
                ),
              ),
            ],
          ),
          large: (_) => Row(
            children: [
              Container(
                color: Colors.indigo[700],
                height: double.infinity,
                width: 130,
              ),
              Container(
                color: Colors.amber[900],
                height: double.infinity,
                width: 70,
              ),
              const Expanded(
                child: Center(
                  child: Text("Large"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
