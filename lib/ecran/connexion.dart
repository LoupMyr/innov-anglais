import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innov_anglais/class/api.dart';
import 'dart:convert' as convert;
import 'package:innov_anglais/local.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key, required this.title});

  final String title;

  @override
  ConnexionState createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();
  String _login = "";
  String _password = "";
  bool _connexion = false;

  Future<http.Response> recupConnect(String login, String mdp) {
    return http.post(
      Uri.parse(
          'http://s3-4428.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/authentication_token'),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
      },
      body: convert
          .jsonEncode(<String, String>{'username': login, 'password': mdp}),
    );
  }

  void afficheToken() async {
    var connexion = await Api.recupConnect(_login, _password);
    log(_login);
    log(_password);
    if (connexion.statusCode == 200) {
      localLogin = _login;
      localPassword = _password;
      var data = convert.jsonDecode(connexion.body);
      var token = data['token'].toString();
      localToken = token;
      log(token);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Connexion impossible'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/inscription');
                },
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Login"),
                  validator: (valeur) {
                    if (valeur == null || valeur.isEmpty) {
                      return 'Veuillez entrer votre login';
                    } else {
                      _login = valeur.toString();
                    }
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Mot de passe"),
                  validator: (valeur) {
                    if (valeur == null || valeur.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    } else {
                      _password = valeur.toString();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      afficheToken();
                    }
                  },
                  child: const Text("Se connecter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
