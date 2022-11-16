import 'package:innov_anglais/class/test.dart';
import 'package:innov_anglais/local.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Api {
  String _login = localLogin;
  String _password = localPassword;
  String _token = localToken;

  Api();

  static Future<http.Response> recupConnect(String login, String mdp) {
    return http.post(
      Uri.parse(
          //'https://s3-4428.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/authentication_token'),
          'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/authentication_token'),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
      },
      body: convert
          .jsonEncode(<String, String>{'username': login, 'password': mdp}),
    );
  }

  Future<void> UpdateToken() async {
    var connexion = await Api.recupConnect(_login, _password);
    if (connexion.statusCode == 200) {
      var data = convert.jsonDecode(connexion.body);
      localToken = data['token'].toString();
    }
  }

  Future<http.Response> getMots() async {
    await UpdateToken();
    return http.get(
      Uri.parse(
          //'https://s3-4428.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/mots'
          'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/mots'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': "Bearer $localToken",
      },
    );
  }

  Future<List<dynamic>> getWordsByListId(int id) async {
    var data = convert.jsonDecode((await getMots()).body);
    List<dynamic> lesMots = [];
    for (var elt in data) {
      if (elt['appartenir'].contains(
          '/Inno-v-Anglais/InovApi/public/api/listes/${id.toString()}')) {
        lesMots.add(elt);
      }
    }
    return lesMots;
  }

  Future<http.Response> getUsers() async {
    await UpdateToken();
    return http.get(
      Uri.parse(
          //'https://s3-4428.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/users'
          'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/mots'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': "Bearer $localToken",
      },
    );
  }

  Future<dynamic> getUser() async {
    var data = convert.jsonDecode((await getUsers()).body);
    var user;
    for (var elt in data) {
      if (elt['username'] == localLogin) {
        user = elt;
      }
    }
    return user;
  }

  Future<http.Response> getLists() async {
    await UpdateToken();
    return http.get(
      Uri.parse(
          //'https://s3-4428.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/listes/'
          'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/listes'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': "Bearer $localToken",
      },
    );
  }

  //obtiens la liste des mots ayant un theme donne
  Future<List<Mot>> getWordsByTheme({required String theme}) async {
    await UpdateToken();
    var reponse = await http.get(
        Uri.parse("https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/listes"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $localToken'
        });
    if (reponse.statusCode == 200) {
      for (var liste in convert.jsonDecode(reponse.body)) {
        if (liste['theme'] == theme) {
          int id = liste['id'];
          var reponse = await http.get(
              Uri.parse(
                  "https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/mots"),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $localToken'
              });
          if (reponse.statusCode == 200) {
            List<Mot> mesMots = [];
            List apiMots = convert.jsonDecode(reponse.body);
            for (var mot in apiMots) {
              for (var theme in mot['appartenir']) {
                if (theme == '/Inno-v-Anglais/public/api/listes/$id') {
                  mesMots.add(Mot.fromMap(mot));
                }
              }
            }
            return mesMots;
          }
        }
      }
      print("Error: no such theme!");
      return [];
    } else {
      throw Exception("Error: Api sent Code: ${reponse.statusCode}");
    }
  }
}
