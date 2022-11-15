import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Jeu extends StatefulWidget {
  const Jeu({super.key, required this.title});

  final String title;
  @override
  State<Jeu> createState() => JeuState();
}

class JeuState extends State<Jeu> {
  final rand = Random();
  bool type = true;
  int count = 0;
  Mot motChoisi = Mot(francais: "oui", anglais: "yes", theme: "theme");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(motChoisi.anglais),
            const Padding(padding: EdgeInsets.all(50)),
            type ? saisie() : boutons()
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => setState(() => type = !type)),
    );
  }

  //retourne un qcm de 4 choix pour le questionaire
  boutons() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: checkResp("oui"), child: const Text("oui")),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(onPressed: checkResp("non"), child: const Text("non"))
        ],
      ),
      const Padding(padding: EdgeInsets.all(10)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: checkResp("peut etre"),
              child: const Text("peut etre")),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: checkResp("jamais"), child: const Text("jamais"))
        ],
      )
    ]);
  }

  //retourne un champ de saisie pour le questionaire
  saisie() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 250,
            child: TextFormField(
              decoration: const InputDecoration(label: Text(' Reponse')),
            )),
        const Padding(padding: EdgeInsets.all(10)),
        ElevatedButton(onPressed: () {}, child: const Text("valider"))
      ],
    );
  }

  checkResp(String resp) {
    //type = rand.nextInt(1) == 0;
    if (resp == motChoisi.francais) {}
  }
}

Future<Map<String, String>> getMots() async {
  String url = "url";
  var reponse = await http.get(Uri.parse(url));
  if (reponse.statusCode == 200) {
    return jsonDecode(reponse.body);
  } else {
    throw Exception("erreur de connection a l'api");
  }
}

class Mot {
  //attributs
  late String francais;
  late String anglais;
  late String theme;
  //constructeur
  Mot({required this.francais, required this.anglais, required this.theme});
  Mot.fromMap(Map<String, String> map) {
    francais = map["francais"] ?? "";
    anglais = map["anglais"] ?? "";
    theme = map["theme"] ?? "";
  }
}
