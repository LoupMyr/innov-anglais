import 'package:flutter/material.dart';
import 'package:innov_anglais/menuTests.dart';
import 'package:innov_anglais/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Innov\'Anglais'),
        routes: <String, WidgetBuilder>{
          '/routeMenuTests': (BuildContext context) =>
              const MenuTestsPage(title: 'Innov\'Anglais - Tests'),
        });
  }
}
