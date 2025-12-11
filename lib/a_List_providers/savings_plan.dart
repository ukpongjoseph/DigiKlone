import 'package:flutter/material.dart';

class DigiSavingsPlans extends ChangeNotifier {
  final List<Map<String, dynamic>> _savingPlans = [
    {
      "icon": Icon(Icons.savings_outlined),
      "rate": "18.5%",
      "type": "DigiSave",
      "description": "Regular Savings",
      "field": "Balance",
      "balance": "₦45,000",
      "color": const Color.fromARGB(255, 117, 188, 246),
      "avatar_color": const Color.fromARGB(255, 148, 200, 243),
      "container-color": const Color.fromARGB(255, 3, 60, 110),
    },
    {
      "icon": Icon(Icons.track_changes_outlined),
      "rate": "18.5%",
      "type": "DigiTarget",
      "description": "Goal-Based Savings",
      "field": "Balance",
      "balance": "₦125,000",
      "color": const Color.fromARGB(255, 109, 238, 114),
      "avatar-color": const Color.fromARGB(255, 156, 243, 159),
      "container-color": const Color.fromARGB(255, 4, 122, 6),
    },
    {
      "icon": Icon(Icons.shield_outlined),
      "rate": "21.0%",
      "type": "DigiLock",
      "description": "Fixed Deposit",
      "field": "Balance",
      "balance": "₦250,000",
      "color": const Color.fromARGB(255, 242, 133, 125),
      "avatar_color": const Color.fromARGB(255, 237, 162, 157),
      "container-color": const Color.fromARGB(255, 116, 3, 40),
    },
    {
      "icon": Icon(Icons.people_alt_outlined),
      "rate": "18.5%",
      "type": "DigiTribe",
      "description": "Group Savings",
      "field": "status",
      "balance": "Coming Soon",
      "color": const Color.fromARGB(255, 217, 110, 235),
      "avatar_color": const Color.fromARGB(255, 232, 163, 244),
      "container-color": const Color.fromARGB(255, 108, 4, 126),
    },
  ];

  final Map<String, dynamic> _totalsavings = {
    "progress_type": "increase",
    "percentage": "12.5%",
    "total saved": "₦420, 500",
    "plans": 3,
    "interest": "₦3,240",
    "saved": "₦15,750",
  };

  final List<Map<String, dynamic>> _recentActivities = [
    {
      "amount": "₦5000",
      "activity": "DigiSave Deposit",
      "source": "Auto-save from main wallet",
      "timeStamp": DateTime.now(),
      "status": null,
    },
    {
      "amount": "₦1250",
      "activity": "Interest Earned",
      "source": "DigiLock fixed deposit",
      "timeStamp": DateTime.now(),
      "status": null,
    },
    {
      "amount": "₦10000",
      "activity": "Goal Milestone",
      "source": "Vacation fund",
      "timeStamp": DateTime.now(),
      "status": "75% complete",
    },
  ];

  List<Map<String, dynamic>> fetchRecentActivities() {
    return _recentActivities;
  }

  Map<String, dynamic> fetchTotalSavings() {
    return _totalsavings;
  }

  List<Map<String, dynamic>> fetchPlans() {
    return _savingPlans;
  }
}
