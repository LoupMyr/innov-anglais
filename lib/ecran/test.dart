import 'package:flutter/material.dart';
import 'package:innov_anglais/ecran/test_tool.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.title});

  final String title;
  @override
  State<TestPage> createState() => TestState();
}

class TestState extends State<TestPage> {
  final TestTools tool = TestTools();

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
            Text(tool.motChoisi.anglais),
            const Padding(padding: EdgeInsets.all(50)),
            tool.type ? saisie() : boutons(),
            const Padding(padding: EdgeInsets.all(50)),
            Text("Score: ${tool.score}"),
          ],
        ),
      ),
      //bouton pour debug
      /*floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => tool.type = !tool.type)),*/
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

  //verifie la reponse
  void checkResp(String resp) async {
    if (resp == tool.motChoisi.francais) {
      tool.score++;
    }
    await tool.choisirMot();
    setState(() {
      tool.count++;
    });
    if (tool.count == 10) {
      Navigator.pop(context);
    }
  }
}
