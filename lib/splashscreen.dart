import 'dart:async';
import 'package:flutter/material.dart';
import 'package:innov_anglais/ecran/myhomepage.dart';
import 'package:innov_anglais/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(title: 'innovanglais'))));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 238, 215, 6),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SpinKitPouringHourGlass(
                          color: Colors.black, size: 150)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
