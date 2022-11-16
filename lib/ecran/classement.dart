import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:innov_anglais/splashscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClassementPage extends StatefulWidget {
  const ClassementPage({super.key, required this.title});

  final String title;

  @override
  ClassementPageState createState() => ClassementPageState();
}

class ClassementPageState extends State<ClassementPage> {
  Map<String, dynamic> _users = new Map();
  bool _recupDataBool = false;
  int _status_code = -1;

  Future<String> recupResultats() async {
    String url =
        "http://s3-4428.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/users";
    var reponse = await http.get(Uri.parse(url));
    String result = 'pas de result';
    _status_code = reponse.statusCode;
    if (reponse.statusCode == 200) {
      _users = convert.jsonDecode(reponse.body);
      _recupDataBool = true;
      result = 'result';
    }
    await Future.delayed(const Duration(seconds: 1));
    return result;
  }

  Widget createRows() {
    List tabUser = [];
    List<Widget> tabChildren = [];

    for (int i = 0; i < _users['hydra:totalItems']; i++) {
      tabUser.add(_users['hydra:member'][i]);
    }
    int nbIterations = 3;
    if (tabUser.length < 3) {
      nbIterations = tabUser.length;
    }
    for (int i = 0; i < nbIterations; i++) {
      for (int j = i + 1; j < tabUser.length; j++) {
        if (tabUser[i]['scoreTotal'] < tabUser[j]['scoreTotal']) {
          var temp = tabUser[i];
          tabUser[i] = tabUser[j];
          tabUser[j] = temp;
        }
      }
    }
    for (int i = 0; i < nbIterations; i++) {
      AssetImage img = AssetImage('lib/assets/innovAnglaisLogo.png');
      if (i == 0) {
        img = AssetImage('lib/assets/goldMedal.png');
      }
      if (i == 1) {
        img = AssetImage('lib/assets/silverMedal.png');
      }
      if (i == 2) {
        img = AssetImage('lib/assets/bronzeMedal.png');
      }
      tabChildren.add(
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.87,
            height: MediaQuery.of(context).size.width * 0.20,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image(image: img),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(tabUser[i]['username']),
                ),
                Text(tabUser[i]['scoreTotal'].toString()),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: tabChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: recupResultats(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Voici le classement des utilisateurs avec les meilleurs résultats:',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                children: <Widget>[
                  createRows(),
                ],
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const SpinKitCubeGrid(
                color: Colors.red,
              )
            ];
          } else {
            children = <Widget>[
              const SpinKitCubeGrid(
                color: Colors.orange,
                size: 100,
              )
            ];
          }
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
                child: Column(children: children),
              ),
            ),
          );
        });
  }
}
