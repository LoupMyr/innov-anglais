import 'package:flutter/material.dart';
import 'package:innov_anglais/ecran/myhomepage.dart';
import 'package:innov_anglais/ecran/menuTests.dart';
import 'package:innov_anglais/ecran/connexion.dart';
import 'package:innov_anglais/ecran/inscription.dart';
import 'package:innov_anglais/ecran/test.dart';
import 'package:innov_anglais/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Innov Anglais',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: "Innov'Anglais"),
      routes: <String, WidgetBuilder>{
        '/routeMenuTests': (BuildContext context) =>
            const MenuTestsPage(title: "Innov'Anglais - Tests"),
        '/routeTestPage': (BuildContext context) =>
            TestPage(title: "Innov'Anglais - Tests"),
        '/inscription': (BuildContext context) =>
            const Inscription(title: "Innov'Anglais"),
        '/connexion': (BuildContext context) =>
            const Connexion(title: "Innov'Anglais"),
        '/home': (BuildContext context) =>
            const HomeScreen(title: "Innov'Anglais"),
      },
    );
  }
}
