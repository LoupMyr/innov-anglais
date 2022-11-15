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
  List<Container> container = [
    Container(
      alignment: Alignment.center,
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.cyan.shade200),
    ),
    Container(
      alignment: Alignment.center,
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.cyan.shade200),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            centerTitle: true,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage(
                  ("lib/assets/innovAnglaisLogo.png"),
                ),
              ),
            ),
            backgroundColor: Colors.yellow,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
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
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                          /*PageView.builder(
                              itemCount: container.length,
                              pageSnapping: true,
                              itemBuilder: (context, pagePosition) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.cyan.shade200),
                                  ),
                                );
                              }),*/
                          Row(
                            children: [
                              const Padding(padding: EdgeInsets.all(8)),
                              Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.185,
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
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
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
                        ]),
                  )),
            ),
          )
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
                    onPressed: () => null,
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

  Widget _gameContainer() {
    return Container();
  }
}
