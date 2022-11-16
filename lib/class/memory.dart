import 'dart:math';

class MemoryGame {
  List<List<int>> laGrille = [];

  MemoryGame();

  void initGrille() {
    List<int> lesValeurs = [];
    for (int k = 0; k < 16; k++) {
      lesValeurs.add(k % 8);
    }
    for (int k = 0; k < 4; k++) {
      laGrille.add([]);
      for (int i = 0; i < 4; i++) {
        int index = Random().nextInt(lesValeurs.length);
        laGrille[k].add(lesValeurs[index]);
        lesValeurs.removeAt(index);
      }
    }
  }
}
