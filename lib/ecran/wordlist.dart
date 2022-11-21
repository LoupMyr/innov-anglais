import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:innov_anglais/class/api.dart';
import 'package:innov_anglais/class/test.dart';

class WordList extends StatefulWidget {
  WordList({super.key, required this.title});

  final String title;
  @override
  State<WordList> createState() => WordListState();
}

class WordListState extends State<WordList> {
  Api api = Api();
  List<dynamic> list = [];
  bool recupDataBool = false;

  void recupData(int id) async {
    list = await api.getWordsByListId(id);
    setState(() {
      recupDataBool = true;
    });
  }

  Widget buildText(int index, int langue) {
    if (langue == 0) {
      return Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 20,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.lightBlueAccent)),
          child: Text(list[index]['motAnglais'], textAlign: TextAlign.center));
    } else {
      return Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 20,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.lightBlueAccent)),
          child: Text(list[index]['motFrancais'], textAlign: TextAlign.center));
    }
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments as int;
    if (!recupDataBool) {
      recupData(id);
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
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
              ]));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlueAccent)),
                    child: const Text('Anglais',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlueAccent)),
                    child: const Text('Français',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            ...List.generate(
              list.length,
              (y) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (x) => buildText(y, x)),
              ),
            ),
          ]),
        ));
  }
}
