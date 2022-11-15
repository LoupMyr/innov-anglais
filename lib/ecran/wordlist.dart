import 'package:flutter/material.dart';
import 'package:innov_anglais/class/api.dart';
import 'package:innov_anglais/ecran/test_tool.dart';
import 'package:innov_anglais/local.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WordList extends StatefulWidget {
  WordList({super.key, required this.title});

  final String title;
  @override
  State<WordList> createState() => WordListState();
}

class WordListState extends State<WordList> {
  Api api = Api();
  int id = 1;
  List<dynamic> list = [];
  bool recupDataBool = false;

  void recupData() async {
    list = await api.getWordsByListId(id);
    setState(() {
      recupDataBool = true;
    });
  }

  Widget buildText(int index, int langue) {
    if (langue == 0) {
      return Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(list[index]['motAnglais'], textAlign: TextAlign.center));
    } else {
      return Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(list[index]['motFrancais'], textAlign: TextAlign.center));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!recupDataBool) {
      recupData();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: List.generate(
              list.length,
              (y) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (x) => buildText(y, x)),
              ),
            ),
          ),
        ));
  }
}
