import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/pages/home_page.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/pages/sign_up.dart';
import 'package:second_flutter/providers/auth_provider.dart';

// This the root of the application. The main method is the entry point ofthe flutter application
void main() {
  // We call the runApp method to run the application but we wrap it around a changeNotifier to ensure state management which will ensure data is accessible across the entire app
  runApp(
    // The ChangeNotifierProvider is used to wrap the entire app so that the global state is accessible through out the widget tree. It takes a create method and a child, this child is the root of the entire application which is the MyApp Widget. The create method is used to create an instance of the Provider Class which holds the global state
    ChangeNotifierProvider(
      create: (context)=>AuthProvider(),
      child: MyApp(),
    )
  );
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
      // We are creating routes for different screen for the purpose of routing and Navigation between screens
      routes: {
        "/signUp": (context)=>const Signup(),
        "/signIn" : (context)=>const SignIn(),
        "/landing" : (context)=> const LandingPage()
      },
    );
  }
}