import 'package:flutter/material.dart';
import 'package:second_flutter/components/balance_component.dart';
import 'package:second_flutter/components/digi_savings.dart';
import 'package:second_flutter/components/quick_actions.dart';

class LandingHome extends StatefulWidget {
  const LandingHome({super.key});

  @override
  State<LandingHome> createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 246, 248, 248),
        child: Column(
          children: [BalanceComponent(), QuickActions(), DigiSavings()],
        ),
      ),
    );
  }
}
