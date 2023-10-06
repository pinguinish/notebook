import 'package:flutter/material.dart';
import 'package:uikit/const/notebook_colors.dart';

void main() => runApp(_ExampleColor());

class _ExampleColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const colors = <Color>[
      NotebookColors.grey,
      NotebookColors.greyLight,
      NotebookColors.greyMedium,
      NotebookColors.greyBlack,
      NotebookColors.blue,
      NotebookColors.orange,
    ];

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: colors.map((e) => _ExampleColorItems(color: e)).toList(),
        ),
      ),
    );
  }
}

class _ExampleColorItems extends StatelessWidget {
  const _ExampleColorItems({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
