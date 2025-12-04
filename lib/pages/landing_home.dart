import 'package:flutter/material.dart';
import 'package:second_flutter/components/balance_component.dart';
import 'package:second_flutter/components/quick_actions.dart';

class LandingHome extends StatefulWidget {
  const LandingHome({super.key});

  @override
  State<LandingHome> createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [BalanceComponent(), QuickActions()]);
  }
}
