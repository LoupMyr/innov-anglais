import 'dart:developer';

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
          //'https://s3-4430.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/authentication_token'
          'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/authentication_token'),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
      },
      body: convert
          .jsonEncode(<String, String>{'username': login, 'password': mdp}),
    );
  }

  void UpdateToken() async {
    var connexion = await Api.recupConnect(_login, _password);
    if (connexion.statusCode == 200) {
      var data = convert.jsonDecode(connexion.body);
      localToken = data['token'].toString();
    }
  }

  Future<http.Response> getMots() async {
    UpdateToken();
    return http.get(
      Uri.parse(
          //'https://s3-4430.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/listes/' + id.toString()'
          'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/mots'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': "Bearer " + localToken,
      },
    );
  }

  Future<List<dynamic>> getWordsByListId(int id) async {
    var data = convert.jsonDecode((await getMots()).body);
    List<dynamic> lesMots = [];

    for (var elt in data) {
      if (elt['appartenir']
          .contains('/Inno-v-Anglais/public/api/listes/' + id.toString())) {
        lesMots.add(elt);
      }
    }
    return lesMots;
  }
}