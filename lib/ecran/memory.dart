import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innov_anglais/class/memory.dart';
import 'package:innov_anglais/class/test_tool.dart';

class Memory extends StatefulWidget {
  const Memory({super.key, required this.title});

  final String title;
  @override
  State<Memory> createState() => MemoryState();
}

class MemoryState extends State<Memory> {
  MemoryGame memory = MemoryGame();

  Widget buildContainer(int x, int y) {
    return GestureDetector(
        onTap: () => {
              setState(() {
                if (memory.laGrilleRetourne[x][y] == false) {
                  memory.retourne(x, y);
                }
              }),
            },
        child: Container(
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
                  memory.laGrilleRetourne[x][y]
                      ? memory.laGrille[x][y] > 7
                          ? Image(
                              width: MediaQuery.of(context).size.width / 4.6,
                              height: MediaQuery.of(context).size.width / 4.6,
                              image: AssetImage(
                                memory.donneImage(memory.laGrille[x][y]),
                              ))
                          : Text(memory.donneNom(memory.laGrille[x][y]))
                      : Container()
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
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
