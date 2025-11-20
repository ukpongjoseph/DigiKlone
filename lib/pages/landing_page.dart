import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DigiKolne"),
        actions: [
          Icon(
            Icons.person_pin
          ),
          Icon(
            Icons.logout_sharp
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 14, 52, 1),
        padding: EdgeInsets.all(40.0),
        child: Text(
          "Welcome to DigiKlone",
          style: TextStyle(
            color: const Color.fromARGB(255, 3, 9, 85),
            fontWeight: FontWeight.w900,
            fontSize: 50.0,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }
}