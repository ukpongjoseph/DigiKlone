import 'package:flutter/material.dart';

class DigiTargetProviders extends ChangeNotifier {
  late String _savingsName;
  late String _savingsAmount;
  late String _savingsFrequency;
  late String _startDate;
  late String _endDate;
  late bool _automatedPlan;

  void setSavingsName(String savingsName) {
    _savingsName = savingsName;
    notifyListeners();
  }

  void setPlanAutomatiion(bool value) {
    _automatedPlan = value;
    notifyListeners();
  }

  void setSavingsAmount(String savingsAmount) {
    _savingsAmount = savingsAmount;
    notifyListeners();
  }

  void setSavingsFrequency(String savingsFrequency) {
    _savingsFrequency = savingsFrequency;
    notifyListeners();
  }

  void setStartDate(String startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  void setEndDate(String endDate) {
    _endDate = endDate;
    notifyListeners();
  }

  String getSavingsName() => _savingsName;
  String getSavingsAmount() => _savingsAmount;
  String getSavingsFrequency() => _savingsFrequency;
  String getStartDate() => _startDate;
  String getEndDate() => _endDate;
  bool getPlanAutomation() => _automatedPlan;
}
