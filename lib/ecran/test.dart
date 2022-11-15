import 'package:flutter/material.dart';
import 'package:innov_anglais/ecran/test_tool.dart';

class TestPage extends StatefulWidget {
  TestPage({super.key, required this.title});

  final TestTools tool = TestTools();
  final String title;
  @override
  State<TestPage> createState() => TestState();
}

class TestState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: widget.tool.makeTest()),
      //bouton pour debug
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              setState(() => widget.tool.type = !widget.tool.type)),
    );
  }
}
