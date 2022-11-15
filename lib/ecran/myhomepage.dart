import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:innov_anglais/splashscreen.dart';
import 'package:innov_anglais/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool selected = false;
  late PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage("lib/assets/innovAnglaisLogo.png"),
              ),
            ),
            Text("Innov'Anglais")
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(5)),
                      Row(
                        children: const [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            "Explorez",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          IconButton(
                              onPressed: null,
                              icon: Icon(Icons.arrow_drop_down))
                        ],
                      ),
                      _caroussel(),
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(8)),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.cyan,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan.shade200),
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan.shade200),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Row(
                        children: const [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            "Faîtes vos premiers pas",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          IconButton(
                              onPressed: null,
                              icon: Icon(Icons.arrow_drop_down))
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(8)),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.orange,
                                      Colors.yellow.shade300,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(5)),
                                    Text(
                                      "Débutant",
                                      style: TextStyle(fontSize: 15.0),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red.shade300,
                                      ),
                                      child: const Text(
                                        "1",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.green,
                                      Colors.green.shade200,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(5)),
                                    Text(
                                      "Avancé",
                                      style: TextStyle(fontSize: 15.0),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red.shade300,
                                      ),
                                      child: const Text(
                                        "2",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.shade700,
                                      Colors.grey.shade300,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(5)),
                                    Text(
                                      "Expert",
                                      style: TextStyle(fontSize: 15.0),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red.shade300,
                                      ),
                                      child: const Text(
                                        "3",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              )),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        // Couleur BottomAppbar
        color: Colors.yellow,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //Ajout texte + icon
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/routeTestPage"),
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.green,
                    ),
                  ),
                  const Text(
                    "Jouer",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  IconButton(
                    onPressed: () => null,
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.person_rounded,
                    ),
                  ),
                  const Text("Profil"),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  IconButton(
                    onPressed: () => null,
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.school_rounded,
                    ),
                  ),
                  const Text("Apprendre"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => {Navigator.pushNamed(context, '/routeMenuTests')},
          label: const Text("Lancer votre première partie"),
          icon: const Icon(Icons.play_arrow)),
    );
  }

  Widget _caroussel() {
    List<Container> container = [
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.cyan,
        ),
      ),
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.cyan,
        ),
      ),
    ];
    return PageView.builder(
        itemCount: container.length,
        pageSnapping: true,
        controller: _pageController,
        itemBuilder: (context, pagePosition) {
          return Container(
            margin: EdgeInsets.all(10),
            child: container[pagePosition],
          );
        });
  }
}
