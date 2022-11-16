import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JeuSons extends StatefulWidget {
  const JeuSons({super.key, required this.title});

  final String title;

  @override
  JeuSonsState createState() => JeuSonsState();
}

class JeuSonsState extends State<JeuSons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Image.asset('lib/assets/innovAnglaisLogo.png')),
            Text(widget.title,
                style: const TextStyle(
                  fontSize: 18,
                )),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Text("dog"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
