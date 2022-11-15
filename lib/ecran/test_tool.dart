import 'package:flutter/material.dart';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TestTools {
  final Random rand = Random();
  Mot motChoisi = Mot(francais: "oui", anglais: "yes", theme: "theme");
  bool type = true;
  int count = 0;
  int score = 0;

  //fabrique un questionaire pour le test
  Widget makeTest() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(motChoisi.anglais),
        const Padding(padding: EdgeInsets.all(50)),
        type ? saisie() : boutons(),
        const Padding(padding: EdgeInsets.all(50)),
        Text("Score: $count"),
      ],
    );
  }

  //retourne un qcm de 4 choix pour le questionaire
  Widget boutons() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => checkResp("oui"), child: const Text("oui")),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () => checkResp("non"), child: const Text("non"))
        ],
      ),
      const Padding(padding: EdgeInsets.all(10)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => checkResp("peut etre"),
              child: const Text("peut etre")),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () => checkResp("jamais"), child: const Text("jamais"))
        ],
      )
    ]);
  }

  //retourne un champ de saisie pour le questionaire
  Widget saisie() {
    String input = "";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            decoration: const InputDecoration(label: Text(' Reponse')),
            onChanged: (value) => input = value,
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        ElevatedButton(
            onPressed: () => checkResp(input), child: const Text("valider"))
      ],
    );
  }

  //verifie la reponse
  void checkResp(String resp) {
    //type = rand.nextInt(1) == 0;
    if (resp == motChoisi.francais) {
      score++;
    }
    count++;
    if (count == 10) {}
  }
}

class Mot {
  Mot({required this.francais, required this.anglais, required this.theme});
  Mot.fromMap(Map<String, String> map) {
    francais = map["francais"] ?? "";
    anglais = map["anglais"] ?? "";
    theme = map["theme"] ?? "";
  }

  late String francais;
  late String anglais;
  late String theme;
}

Future<Map<String, dynamic>> getMots() async {
  String url = "url";
  var reponse = await http.get(Uri.parse(url));
  if (reponse.statusCode == 200) {
    return jsonDecode(reponse.body);
  } else {
    throw Exception("erreur de connection a l'api");
  }
}
