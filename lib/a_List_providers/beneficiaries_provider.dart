import 'package:flutter/material.dart';

class BeneficiariesProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _beneficiaries = [
    {"name": "Sarah Johnson", "type": "Account", "number": "1234567890"},
    {"name": "Sarah Johnson", "type": "Account", "number": "1234567890"},
    {"name": "Sarah Johnson", "type": "Account", "number": "1234567890"},
    {"name": "Sarah Johnson", "type": "Account", "number": "1234567890"},
  ];

  List<Map<String, dynamic>> fetchBeneficiaries() {
    return _beneficiaries;
  }

  void addBeneficiary(Map<String, dynamic> newBeneficary) {
    _beneficiaries.add(newBeneficary);
    ChangeNotifier();
  }

  void deleteAllBeneficiaries() {
    _beneficiaries.clear();
    ChangeNotifier();
  }
}
