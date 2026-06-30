import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second_flutter/pages/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 100,
      widthFactor: 100,
      child: Image.asset(
        "assets/images/kolodigi.jpg",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      )
    );
  }
}
