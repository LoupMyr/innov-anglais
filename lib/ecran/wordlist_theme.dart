import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innov_anglais/class/api.dart';
import 'package:innov_anglais/local.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WordListTheme extends StatefulWidget {
  WordListTheme({super.key, required this.title});

  final String title;
  @override
  State<WordListTheme> createState() => WordListThemeState();
}

class WordListThemeState extends State<WordListTheme> {
  Api api = Api();
  int id = 1;
  var data;
  bool recupDataBool = false;

  void recupData() async {
    var data2 = await api.getLists();
    log('test');
    log(data2.statusCode.toString());
    data = convert.jsonDecode(data2.body);
    setState(() {
      recupDataBool = true;
    });
  }

  Widget buildTheme(int index) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          child: Text(data[index]['theme']),
          style:
              ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade200),
          onPressed: () =>
              {Navigator.pushNamed(context, "/wordlist", arguments: index + 1)},
        ));
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
        body: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  data == null ? 0 : data.length, (x) => buildTheme(x))),
        ));
  }
}
