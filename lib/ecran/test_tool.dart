import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TestTools {
  Mot motChoisi = Mot(francais: "oui", anglais: "yes", themes: []);
  int count = 0;
  int score = 0;
  //bool type = true;
  bool get type => Random().nextInt(2) == 0;

  Future<void> choisirMot() async {
    //List<dynamic> listMots = await getMots();
    //motChoisi = Mot.fromMap(listMots[0]);
    await setMots();
  }

  Future<String> getToken() async {
    String url =
        "https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/authentication_token";
    var reponse = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, String>{'username': "tozano", 'password': "btsinfo"}),
    );
    if (reponse.statusCode == 200) {
      return jsonDecode(reponse.body)["token"];
    } else {
      throw Exception("Erreur de token");
    }
  }

  Future<List<dynamic>> getMots() async {
    String token = await getToken();
    String url = "https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/mots";
    var reponse = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (reponse.statusCode == 200) {
      return jsonDecode(reponse.body);
    } else {
      throw Exception("Erreur de connection a l'api");
    }
  }

  Future<void> setMots() async {
    String token = await getToken();
    String url = "https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/mots";
    var reponse = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(
          <String, dynamic>{
            "motAnglais": "rice",
            "motFrancais": "riz",
            //"appartenir": [""]
          },
        ));
    if (reponse.statusCode != 201) {
      throw Exception("Erreur de connection a l'api");
    }
  }
}

class Mot {
  Mot({required this.francais, required this.anglais, required this.themes});
  Mot.fromMap(Map<String, dynamic> map) {
    francais = map["francais"] ?? "";
    anglais = map["anglais"] ?? "";
    themes = map["theme"] ?? [];
  }

  late String francais;
  late String anglais;
  late List<String> themes;
}
