import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:innov_anglais/class/test.dart';
import 'dart:math';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.title});

  final String title;
  @override
  State<TestPage> createState() => TestState();
}

class TestState extends State<TestPage> {
  TestTools tool = TestTools();
  late Widget monBody;
  bool get typeDeSaisie => Random().nextInt(2) == 0;

  //permet d'aficher un message de chargement le temps d'initialiser les outils
  @override
  initState() {
    monBody = FutureBuilder(
        future: tool.initTools(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return testBody();
          } else {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SpinKitCubeGrid(
                          color: Colors.orange,
                          size: 100,
                        )
                      ])
                ]);
          }
        });
    super.initState();
  }

  //permet de s'assurer que la saisie de met bien a jour a chaque changement de mot
  @override
  void setState(VoidCallback fn) {
    monBody = testBody();
    super.setState(fn);
  }

  //interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: monBody),
    );
  }

  //retourne un questionaire avec un champ au hasard
  Widget testBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(tool.motChoisi.anglais),
        const Padding(padding: EdgeInsets.all(50)),
        typeDeSaisie ? saisie() : boutons(),
        const Padding(padding: EdgeInsets.all(50)),
        Text("Score: ${tool.score}"),
      ],
    );
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

  //retourne un qcm de 4 choix pour le questionaire
  Widget boutons() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => checkResp(tool.qcm[0]),
              child: Text(tool.qcm[0])),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () => checkResp(tool.qcm[1]), child: Text(tool.qcm[1]))
        ],
      ),
      const Padding(padding: EdgeInsets.all(10)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => checkResp(tool.qcm[2]),
              child: Text(tool.qcm[2])),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () => checkResp(tool.qcm[3]), child: Text(tool.qcm[3]))
        ],
      )
    ]);
  }

  //verifie la reponse
  void checkResp(String resp) {
    if (resp == tool.motChoisi.francais) {
      setState(() {
        tool.score++;
      });
    }
    tool.choisirMot();
    setState(() {
      tool.count++;
    });
    if (tool.count >= 10) {
      Navigator.pop(context);
    }
  }
}
