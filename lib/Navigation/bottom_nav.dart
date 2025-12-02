import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home), 
          label: "Home"
        ),
        NavigationDestination(
          icon: Icon(Icons.pest_control_rounded), 
          label: "Savings"
        ),
        NavigationDestination(
          icon: Icon(Icons.wallet), 
          label: "Wallet"
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_sharp), 
          label: "Activity"
        ),
        NavigationDestination(
          icon: Icon(Icons.person), 
          label: "Me"
        ),
      ]
    );
  }
}