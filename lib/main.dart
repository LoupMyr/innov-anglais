import 'package:flutter/material.dart';
import 'package:innov_anglais/jeu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jeu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Jeu(title: 'jeu'),
    );
  }
}
