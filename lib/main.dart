import 'package:flutter/material.dart';
import 'package:innov_anglais/ecran/myhomepage.dart';
import 'package:innov_anglais/ecran/menuTests.dart';
import 'package:innov_anglais/ecran/connexion.dart';
import 'package:innov_anglais/ecran/inscription.dart';
import 'package:innov_anglais/ecran/myhomepage.dart';

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
      home: const HomeScreen(title: "Innov'Anglais"),
      routes: <String, WidgetBuilder>{
        '/routeMenuTests': (BuildContext context) =>
            const MenuTestsPage(title: "Innov'Anglais - Tests"),
      },
    );
  }
}
