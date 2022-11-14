import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innov_anglais/splashscreen.dart';

class MenuTestsPage extends StatefulWidget {
  const MenuTestsPage({super.key, required this.title});

  final String title;

  @override
  MenuTestsPageState createState() => MenuTestsPageState();
}

class MenuTestsPageState extends State<MenuTestsPage> {
  Widget createRows() {
    List<Widget> tab = [];
    for (int i = 0; i < 20 /* Nb de tests dispo avec l'API*/; i++) {
      tab.add(Row(
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.97,
              height: MediaQuery.of(context).size.width * 0.15,
              child: Center(child: Text(i.toString())),
            ),
          ),
        ],
      ));
    }
    return Column(
      children: tab,
    );
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Voici la liste des tests disponibles:',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                children: <Widget>[
                  createRows(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
