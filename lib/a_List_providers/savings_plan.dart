import 'package:flutter/material.dart';

class DigiSavingsPlans extends ChangeNotifier {
  final List<Map<String, dynamic>> _savingPlans = [
    {
      "icon": Icon(Icons.savings_outlined),
      "rate": "18.5%",
      "type": "DigiSave",
      "description": "Regular Savings",
      "field" : "Balance",
      "balance": "₦45,000",
      "color" : Colors.blue
    },
    {
      "icon": Icon(Icons.track_changes_outlined),
      "rate": "18.5%",
      "type": "DigiTarget",
      "description": "Goal-Based Savings",
      "field" : "Balance",
      "balance": "₦125,000",
      "color" : Colors.green
    },
    {
      "icon": Icon(Icons.shield_outlined),
      "rate": "21.0%",
      "type": "DigiLock",
      "description": "Fixed Deposit",
      "field" : "Balance",
      "balance": "₦250,000",
      "color" : Colors.red
    },
    {
      "icon": Icon(Icons.people_alt_outlined),
      "rate": "18.5%",
      "type": "DigiTribe",
      "description": "Group Savings",
      "field" : "status",
      "balance": "Coming Soon",
      "color" : Colors.purple
    },
  ];

 final Map<String, dynamic> _totalsavings = {
    "progress_type" : "increase",
    "percentage" : "12.5%",
    "total saved" : "₦420, 500",
    "plans" : 3,
    "interest" : "₦3,240",
    "saved" : "₦15,750"
  };

  Map<String, dynamic> fetchTotalSavings(){
    return _totalsavings;
  }

  List<Map<String,dynamic>> fetchPlans(){
    return _savingPlans;
  }

}
