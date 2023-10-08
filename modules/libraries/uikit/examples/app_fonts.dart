import 'package:flutter/material.dart';
import 'package:uikit/const/notebook_fonts.dart';

void main() => runApp(const _ExampleFonts());

class _ExampleFonts extends StatelessWidget {
  const _ExampleFonts();

  @override
  Widget build(BuildContext context) {
    const fontFamilies = <String>[
      NotebookFonts.nunito,
    ];

    return MaterialApp(
      theme: ThemeData(fontFamily: fontFamilies.first),
      home: Scaffold(
        body: Center(
          child: ListView(
            children: fontFamilies
                .map((fontFamily) => _ExampleFontItems(fontFamily: fontFamily))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _ExampleFontItems extends StatelessWidget {
  const _ExampleFontItems({required this.fontFamily});

  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text('Font Family: $fontFamily'),
        const SizedBox(height: 10),
        const Column(
          children: [
            Text('Regular'),
            Text(
              'Medium',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'SemiBold',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              'Bold',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        )
      ],
    );
  }
}
