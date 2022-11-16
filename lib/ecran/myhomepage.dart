import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:innov_anglais/splashscreen.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(1),
              centerTitle: true,
              background:
                  Image(image: AssetImage("lib/assets/innovAnglaisLogo.png")),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      children: const [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "Explorez",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    CarouselSlider(
                        items: [
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade200,
                                      Colors.cyan.shade300,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.all(5)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color.fromARGB(
                                              255, 107, 226, 210)),
                                      child: const Icon(Icons.explore),
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                const Text("Découvre en"),
                                const Text("plus")
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.orange.shade200,
                                      Colors.yellow.shade300,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.all(5)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color.fromARGB(
                                              255, 206, 197, 197)),
                                      child: const Icon(Icons.play_arrow),
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                const Text("Jouer"),
                                const Text("en s'amusant")
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.green.shade200,
                                      Colors.green.shade300,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.all(5)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color.fromARGB(
                                              255, 170, 226, 107)),
                                      child: const Icon(Icons.school),
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                const Text("Apprend"),
                                const Text("de jour en jour")
                              ],
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 120,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          autoPlayCurve: Curves.easeInOutCirc,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(seconds: 5),
                          viewportFraction: 0.8,
                        )),
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      children: const [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "Faîtes vos premiers pas",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    CarouselSlider(
                        items: [
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
                        options: CarouselOptions(
                          reverse: true,
                          height: 120,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          autoPlayCurve: Curves.easeInOutCirc,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(seconds: 5),
                          viewportFraction: 0.8,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
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
        color: Theme.of(context).primaryColor,
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
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Jouer",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/routeClassement')},
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.info,
                    ),
                  ),
                  const Text("Classement"),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  IconButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/wordlistTheme')},
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.menu_book,
                    ),
                  ),
                  const Text("Wordlist"),
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
}
