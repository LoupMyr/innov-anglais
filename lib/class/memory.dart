import 'dart:math';

class MemoryGame {
  List<List<int>> laGrille = [];
  List<List<bool>> laGrilleRetourne = [];
  List<List<int>> lesRetournes = [];

  MemoryGame() {
    List<int> lesValeurs = [];
    for (int k = 0; k < 16; k++) {
      lesValeurs.add(k);
    }
    for (int k = 0; k < 4; k++) {
      laGrille.add([]);
      laGrilleRetourne.add([]);
      for (int i = 0; i < 4; i++) {
        int index = Random().nextInt(lesValeurs.length);
        laGrille[k].add(lesValeurs[index]);
        lesValeurs.removeAt(index);
        laGrilleRetourne[k].add(false);
      }
    }
  }

  void initGrille() {
    List<int> lesValeurs = [];
    for (int k = 0; k < 16; k++) {
      lesValeurs.add(k);
    }
    for (int k = 0; k < 4; k++) {
      laGrille.add([]);
      laGrilleRetourne.add([]);
      for (int i = 0; i < 4; i++) {
        int index = Random().nextInt(lesValeurs.length);
        laGrille[k].add(lesValeurs[index]);
        lesValeurs.removeAt(index);
        laGrilleRetourne[k].add(false);
      }
    }
  }

  void retourne(int x, int y) {
    laGrilleRetourne[x][y] = true;
    lesRetournes.add([x, y]);
    if (lesRetournes.length > 2) {
      if (laGrille[lesRetournes[0][0]][lesRetournes[0][1]] +
              laGrille[lesRetournes[1][0]][lesRetournes[1][1]] ==
          15) {
        lesRetournes = [lesRetournes[2]];
      } else {
        laGrilleRetourne[lesRetournes[0][0]][lesRetournes[0][1]] = false;
        laGrilleRetourne[lesRetournes[1][0]][lesRetournes[1][1]] = false;
        lesRetournes = [lesRetournes[2]];
      }
    }
  }

  String donneImage(int id) {
    String lien = "";
    switch (id) {
      case 8:
        lien = "lib/assets/animaux/canard.jpg";
        break;
      case 9:
        lien = "lib/assets/animaux/chat.jpeg";
        break;
      case 10:
        lien = "lib/assets/animaux/cheval.jpg";
        break;
      case 11:
        lien = "lib/assets/animaux/chien.png";
        break;
      case 12:
        lien = "lib/assets/animaux/cochon.jpeg";
        break;
      case 13:
        lien = "lib/assets/animaux/poule.jpg";
        break;
      case 14:
        lien = "lib/assets/animaux/tortue.jpeg";
        break;
      case 15:
        lien = "lib/assets/animaux/vache.png";
        break;
      default:
    }
    return lien;
  }

  String donneNom(int id) {
    String lien = "";
    switch (id) {
      case 7:
        lien = "duck";
        break;
      case 6:
        lien = "cat";
        break;
      case 5:
        lien = "horse";
        break;
      case 4:
        lien = "dog";
        break;
      case 3:
        lien = "pig";
        break;
      case 2:
        lien = "chicken";
        break;
      case 1:
        lien = "turtle";
        break;
      case 0:
        lien = "cow";
        break;
      default:
    }
    return lien;
  }
}
