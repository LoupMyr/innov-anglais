import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innov_anglais/splashscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MenuTestsPage extends StatefulWidget {
  const MenuTestsPage({super.key, required this.title});

  final String title;

  @override
  MenuTestsPageState createState() => MenuTestsPageState();
}

class MenuTestsPageState extends State<MenuTestsPage> {
  Map<String, dynamic> _tests = new Map();
  bool _recupDataBool = false;
  int _status_code = -1;

  void recupData() async {
    await recupTests();
    if (mounted) {
      setState(() {
        recupTests;
      });
    }
  }

  Future<String> recupTests() async {
    String url =
        "http://s3-4428.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/tests";
    var reponse = await http.get(Uri.parse(url));
    String result = 'pas de result';
    _status_code = reponse.statusCode;
    if (reponse.statusCode == 200) {
      _tests = convert.jsonDecode(reponse.body);
      _recupDataBool = true;
      result = 'result';
    }
    await Future.delayed(const Duration(seconds: 2));
    return result;
  }

  Widget createRows() {
    List<Widget> tab = [];
    int nbTests = 0;
    if (_tests['hydra:totalItems'] != null) {
      nbTests = _tests['hydra:totalItems'];
    }

    for (int i = 0; i < nbTests; i++) {
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
            child: ElevatedButton(
              onPressed: () => lancerTest(i),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.87,
                height: MediaQuery.of(context).size.width * 0.18,
                child: Center(
                  child: Text(_tests['hydra:member'][i]['niveau']),
                ),
              ),
            ),
          ),
        ],
      ));
    }
    return Column(
      children: tab,
    );
  }

  void lancerTest(id) {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: recupTests(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Voici la liste des tests disponibles:',
                      style: TextStyle(fontSize: 20)),
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
