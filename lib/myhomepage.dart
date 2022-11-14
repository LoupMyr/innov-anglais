import 'package:flutter/material.dart';
import 'package:innov_anglais/splashscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  SplashScreenState createState() => SplashScreenState();
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Image.asset('lib/assets/innovAnglaisLogo.png')),
            const Text('Innov\'Anglais',
                style: TextStyle(
                  fontSize: 18,
                )),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 300,
              child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/routeMenuTests'),
                  child: const Text('Menu Tests')),
            ),
          ],
        ),
      ),
    );
  }
}
