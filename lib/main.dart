import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';
import 'package:second_flutter/pages/add_card.dart';
import 'package:second_flutter/pages/digi_lock.dart';
import 'package:second_flutter/pages/digi_save_balance.dart';
import 'package:second_flutter/pages/digi_target.dart';
import 'package:second_flutter/pages/digi_target_savings.dart';
import 'package:second_flutter/pages/faq.dart';
import 'package:second_flutter/pages/home_page.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/pages/lock_funds.dart';
import 'package:second_flutter/pages/refer_friends.dart';
import 'package:second_flutter/pages/security.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/pages/signup/confirm_password.dart';
import 'package:second_flutter/pages/signup/email.dart';
import 'package:second_flutter/pages/signup/firstname.dart';
import 'package:second_flutter/pages/signup/lastname.dart';
import 'package:second_flutter/pages/signup/password.dart';
import 'package:second_flutter/a_List_providers/auth_login_provider.dart';
import 'package:second_flutter/a_List_providers/auth_register.dart';
import 'package:second_flutter/pages/support.dart';

// This the root of the application. The main method is the entry point ofthe flutter application
void main() {
  // We call the runApp method to run the application but we wrap it around a changeNotifier to ensure state management which will ensure data is accessible across the entire app
  runApp(
    // The ChangeNotifierProvider is used to wrap the entire app so that the global state is accessible through out the widget tree. It takes a create method and a child, this child is the root of the entire application which is the MyApp Widget. The create method is used to create an instance of the Provider Class which holds the global state
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AuthloginProvider()),
        ChangeNotifierProvider(create: (context) => NavProvider()),
      ],
      child: MyApp(),
    ),
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
        "/signIn": (context) => const SignIn(),
        "/landing": (context) => const LandingPage(),
        "/firstname": (context) => const Firstname(),
        "/lastname": (context) => const Lastname(),
        "/email": (context) => const Email(),
        "/password": (context) => Password(),
        "/confirm-password": (context) => const ConfirmPassword(),
        "/digiTargetSavings": (context) => const DigiTargetSavings(),
        "/lockFunds": (context) => const LockFunds(),
        "/referFriends": (context) => const ReferFriends(),
        "/security": (context) => const Security(),
        "/addCard": (context) => const AddCard(),
        "/support": (context) => const Support(),
        "/faq": (context) => const Faq(),
        "/digiSaveBalance": (context) => const DigiSaveBalance(),
        "/digiTargetPage": (context) => const DigiTarget(),
        "/digiLockPage": (context) => const DigiLock(),
      },
    );
  }
}
