import 'dart:math';
import 'dart:async';
import 'package:innov_anglais/class/api.dart';

class TestTools {
  Api api = Api();
  late List<Mot> lesMots;
  late Mot motChoisi;
  late List<String> qcm;
  int count = 0;
  int score = 0;

  //initialise les attributs
  Future<bool> initTools() async {
    lesMots = await api.getWordsByTheme(theme: "La maison");
    choisirMot();
    return true;
  }

  //change le mot choisi et les choix possibles pour le qcm
  void choisirMot() {
    print("nouveaumot");
    List lesMotsTemp = [] + lesMots;
    qcm = [];
    motChoisi = lesMotsTemp[Random().nextInt(lesMotsTemp.length - 1)];
    qcm.add(motChoisi.francais);
    lesMotsTemp.remove(motChoisi);
    Mot motTemp = lesMotsTemp[Random().nextInt(lesMotsTemp.length - 1)];
    qcm.add(motTemp.francais);
    lesMotsTemp.remove(motTemp);
    motTemp = lesMotsTemp[Random().nextInt(lesMotsTemp.length - 1)];
    qcm.add(motTemp.francais);
    lesMotsTemp.remove(motTemp);
    motTemp = lesMotsTemp[Random().nextInt(lesMotsTemp.length - 1)];
    qcm.add(motTemp.francais);
    lesMotsTemp.remove(motTemp);
    qcm.shuffle();
  }
}

class Mot {
  Mot({required this.francais, required this.anglais, required this.themes});
  Mot.fromMap(Map<String, dynamic> map) {
    francais = map["motFrancais"] ?? "";
    anglais = map["motAnglais"] ?? "";
    themes = map["appartenir"] ?? [];
  }

  late String francais;
  late String anglais;
  late List<dynamic> themes;
}
