import 'package:flutter/material.dart';
import 'package:innov_anglais/ecran/classement.dart';
import 'package:innov_anglais/ecran/myhomepage.dart';
import 'package:innov_anglais/ecran/menuTests.dart';
import 'package:innov_anglais/ecran/connexion.dart';
import 'package:innov_anglais/ecran/inscription.dart';
import 'package:innov_anglais/ecran/test.dart';
import 'package:innov_anglais/ecran/wordlist.dart';
import 'package:innov_anglais/ecran/wordlist_theme.dart';
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
        primaryColor: Colors.lightBlueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: "Innov'Anglais"),
      routes: <String, WidgetBuilder>{
        '/routeMenuTests': (BuildContext context) =>
            const MenuTestsPage(title: "Innov'Anglais - Tests"),
        '/routeTestPage': (BuildContext context) =>
            TestPage(title: "Innov'Anglais - Tests"),
        '/inscription': (BuildContext context) =>
            const Inscription(title: "Inscription"),
        '/connexion': (BuildContext context) =>
            const Connexion(title: "Connexion"),
        '/home': (BuildContext context) =>
            const HomeScreen(title: "Innov'Anglais"),
        '/routeClassement': (BuildContext context) =>
            const ClassementPage(title: "Innov'Anglais"),
        '/wordlist': (BuildContext context) => WordList(title: "Innov'Anglais"),
        '/wordlistTheme': (BuildContext context) =>
            WordListTheme(title: "Innov'Anglais"),
        '/routeClassement': (BuildContext context) =>
            ClassementPage(title: "Innov'Anglais"),
      },
    );
  }
}
///routeClassement
