import 'package:flutter/material.dart';
import 'package:yearly/pages/authenticated/interactive_viewer_example.dart';
class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: InteractiveViewerExample(),
      ),
    );
  }
}