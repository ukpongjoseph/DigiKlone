import 'package:flutter/material.dart';
import 'package:second_flutter/pages/digi_save_balance.dart';
import 'package:second_flutter/pages/digi_target.dart';
import 'package:second_flutter/pages/lock_funds.dart';

class DigiSavingsPlans extends ChangeNotifier {
  DateTime time = DateTime.now();
  final List<Map<String, dynamic>> _savingPlans = [
    {
      "icon": Icons.savings_outlined,
      "rate": "18.5%",
      "type": "DigiSave",
      "description": "Regular Savings",
      "field": "Balance",
      "balance": "₦45,000",
      "color": const Color(0xFF0F172A),
      "light_color": const Color.fromARGB(255, 73, 112, 204),
      "avatar_color": const Color.fromARGB(255, 117, 188, 246),
      "container-color": const Color.fromARGB(255, 3, 60, 110),
      "page_exists": true,
      "page": DigiSaveBalance(),
    },
    {
      "icon": Icons.track_changes_outlined,
      "rate": "18.5%",
      "type": "DigiTarget",
      "description": "Goal-Based Savings",
      "field": "Balance",
      "balance": "₦125,000",
      "light_color": const Color.fromARGB(255, 74, 206, 98),
      "color": const Color.fromARGB(255, 15, 42, 20),
      "avatar-color": const Color.fromARGB(255, 109, 238, 114),
      "container-color": const Color.fromARGB(255, 4, 122, 6),
      "page_exists": true,
      "page": DigiTarget(),
    },
    {
      "icon": Icons.shield_outlined,
      "rate": "21.0%",
      "type": "DigiLock",
      "description": "Fixed Deposit",
      "field": "Balance",
      "balance": "₦250,000",
      "light_color": const Color.fromARGB(255, 207, 74, 94),
      "color": const Color.fromARGB(255, 42, 15, 19),
      "avatar_color": const Color.fromARGB(255, 242, 133, 125),
      "container-color": const Color.fromARGB(255, 116, 3, 40),
      "page_exists": true,
      "page": LockFunds(),
    },
    {
      "icon": Icons.people_alt_outlined,
      "rate": "18.5%",
      "type": "DigiTribe",
      "description": "Group Savings",
      "field": "status",
      "balance": "Coming Soon",
      "light_color": const Color.fromARGB(255, 181, 66, 164),
      "color": const Color.fromARGB(255, 42, 15, 38),
      "avatar_color": const Color.fromARGB(255, 217, 110, 235),
      "container-color": const Color.fromARGB(255, 108, 4, 126),
      "page_exists": false,
      "page": null,
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
      "timeStamp": "2025-11-03 14:22:57.183",
      "status": null,
      "transaction_type": "credit",
      "type": "savings",
      "color1": Colors.blue[200],
    },
    {
      "amount": "₦1250",
      "activity": "Interest Earned",
      "source": "DigiLock fixed deposit",
      "timeStamp": "2024-07-19 08:41:12.905",
      "status": null,
      "transaction_type": "credit",
      "type": "lock",
      "color": Colors.green[200],
    },
    {
      "amount": "₦10000",
      "activity": "Goal Milestone",
      "source": "Vacation fund",
      "timeStamp": "2026-03-28 21:05:49.327",
      "status": "75% complete",
      "transaction_type": "credit",
      "type": "target",
      "color": Colors.green[200],
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
