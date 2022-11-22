import 'dart:developer';

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
      Uri.parse(localUrl + 'authentication_token'),
      //'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/authentication_token'),
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
      Uri.parse(localUrl + 'mots'),
      //'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/mots'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': "Bearer $localToken",
      },
    );
  }

  Future<List<dynamic>> getWordsByListId(int id) async {
    await UpdateToken();
    var data = convert.jsonDecode((await getLists()).body);
    List<dynamic> lesMots = [];
    log(data.toString());
    for (var elt in data) {
      if (elt['id'] == id) {
        lesMots = elt['mots'];
      }
    }
    return lesMots;
  }

  Future<http.Response> getUsers() async {
    await UpdateToken();
    return http.get(
      Uri.parse(localUrl + 'users'),
      headers: <String, String>{
        //'Accept': 'application/json',
        'Authorization': "Bearer $localToken",
      },
    );
  }

  Future<dynamic> getUser() async {
    var data = convert.jsonDecode((await getUsers()).body);
    var user;
    log(data.toString());
    for (var elt in data['hydra:member']) {
      if (elt['username'] == localLogin) {
        user = elt;
      }
    }
    return user;
  }

  Future<http.Response> getLists() async {
    await UpdateToken();
    return http.get(
      Uri.parse(localUrl + 'listes'),
      //'https://tanguy.ozano.ovh/Inno-v-Anglais/public/api/listes'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': "Bearer $localToken",
      },
    );
  }

  //obtiens la liste des mots ayant un theme donne
  Future<List<Mot>> getWordsByTheme({required String theme}) async {
    await UpdateToken();
    var data = convert.jsonDecode((await getLists()).body);
    List<Mot> lesMots = [];
    log(data.toString());
    for (var elt in data) {
      if (elt['theme'] == theme) {
        for (var elt in elt['mots']) {
          lesMots.add(Mot.fromMap(elt));
        }
      }
    }
    return lesMots;
  }
}
