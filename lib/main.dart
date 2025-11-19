import 'package:flutter/material.dart';
import 'package:second_flutter/pages/home_page.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/pages/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        "/signUp": (context)=>const Signup(),
        "/signIn" : (context)=>const SignIn(),
        "/landing" : (context)=> const LandingPage()
      },
    );
  }
}




