import 'package:flutter/material.dart';
import 'package:uikit/const/notebook_icons.dart';

void main() => runApp(const _AppIcons());

class _AppIcons extends StatelessWidget {
  const _AppIcons();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _ExampleWidget(),
      ),
    );
  }
}

class _ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Icon(NotebookIcons.paintFormat),
        SizedBox(height: 10),
        Icon(NotebookIcons.cover),
        SizedBox(height: 10),
        Icon(NotebookIcons.readingList),
        SizedBox(height: 10),
        Icon(NotebookIcons.journal),
        SizedBox(height: 10),
        Icon(NotebookIcons.fileUntitled),
        SizedBox(height: 10),
        Icon(NotebookIcons.file),
        SizedBox(height: 10),
        Icon(NotebookIcons.duplicate),
        SizedBox(height: 10),
        Icon(NotebookIcons.quickNote),
        SizedBox(height: 10),
        Icon(NotebookIcons.undo),
        SizedBox(height: 10),
        Icon(NotebookIcons.moveTo),
        SizedBox(height: 10),
        Icon(NotebookIcons.comment),
        SizedBox(height: 10),
        Icon(NotebookIcons.person),
        SizedBox(height: 10),
        Icon(NotebookIcons.search),
        SizedBox(height: 10),
        Icon(NotebookIcons.customizer),
        SizedBox(height: 10),
        Icon(NotebookIcons.settings),
        SizedBox(height: 10),
        Icon(NotebookIcons.delete),
        SizedBox(height: 10),
        Icon(NotebookIcons.power),
        SizedBox(height: 10),
        Icon(NotebookIcons.import),
        SizedBox(height: 10),
        Icon(NotebookIcons.link),
        SizedBox(height: 10),
        Icon(NotebookIcons.attachment),
        SizedBox(height: 10),
        Icon(NotebookIcons.starOutlined),
        SizedBox(height: 10),
        Icon(NotebookIcons.starFilled),
        SizedBox(height: 10),
        Icon(NotebookIcons.smileFace),
        SizedBox(height: 10),
        Icon(NotebookIcons.add),
        SizedBox(height: 10),
        Icon(NotebookIcons.close),
        SizedBox(height: 10),
        Icon(NotebookIcons.open),
        SizedBox(height: 10),
        Icon(NotebookIcons.turnIntoWiki),
        SizedBox(height: 10),
        Icon(NotebookIcons.textLink),
        SizedBox(height: 10),
        Icon(NotebookIcons.taskList),
        SizedBox(height: 10),
        Icon(NotebookIcons.bold),
        SizedBox(height: 10),
        Icon(NotebookIcons.underline),
        SizedBox(height: 10),
        Icon(NotebookIcons.italic),
        SizedBox(height: 10),
        Icon(NotebookIcons.strikethrough),
        SizedBox(height: 10),
        Icon(NotebookIcons.embed),
        SizedBox(height: 10),
        Icon(NotebookIcons.filePdf),
        SizedBox(height: 10),
      ],
    );
  }
}