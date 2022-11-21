import 'package:flutter/material.dart';
import 'package:innov_anglais/class/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key, required this.title});

  final String title;

  @override
  ProfilPageState createState() => ProfilPageState();
}

class ProfilPageState extends State<ProfilPage> {
  String _nom = '';
  String _prenom = '';
  String _login = '';
  String _err = '';
  Api api = Api();
  int id = 1;
  var user;
  bool recupDataBool = false;

  void recupProfil() async {
    user = await api.getUser();
    if (user != null || !user.isEmpty) {
      setState(() {
        _nom = user['nom'].toString();
        _prenom = user['prenom'].toString();
        _login = user['username'].toString();

        recupDataBool = true;
        _err = '';
      });
    } else {
      _err = 'Erreur lors de la récupération des données';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!recupDataBool) {
      recupProfil();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Image.asset('lib/assets/innovAnglaisLogo.png')),
            Text(widget.title,
                style: const TextStyle(
                  fontSize: 18,
                )),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Profil',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                children: <Widget>[
                  Text(_err),
                ],
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 150,
                    child: Text('Nom:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Text(_nom, style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 150,
                    child: Text('Prenom:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Text(_prenom, style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 150,
                    child: Text('Login:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Text(_login, style: const TextStyle(fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/routeClassement"),
        child: const Icon(Icons.info),
      ),
    );
  }
}
