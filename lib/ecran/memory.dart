import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innov_anglais/class/memory.dart';
import 'package:innov_anglais/ecran/test_tool.dart';

class Memory extends StatefulWidget {
  const Memory({super.key, required this.title});

  final String title;
  @override
  State<Memory> createState() => MemoryState();
}

class MemoryState extends State<Memory> {
  MemoryGame memory = MemoryGame();

  Widget buildContainer(int x, int y) {
    return Container(
        width: MediaQuery.of(context).size.width / 4.6,
        height: MediaQuery.of(context).size.width / 4.6,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  memory.laGrille[x][y].toString(),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    memory.initGrille();
    log(memory.laGrille.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (x) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (y) => buildContainer(x, y)),
                    ))),
      ),
    );
  }
}
