import 'package:flutter/material.dart';

class DigiLockProvider extends ChangeNotifier {
  late int _amount;
  late int _days;
  late String _interestPayment;
  late String _title;
  late double _interest;

  int getAmount()=>_amount;
  int getDays()=>_days;
  String getInterestPayment()=>_interestPayment;
  String getSavingsTitle()=>_title;
  double getSavingsInterest()=>_interest;

  void setAmount(int amount){
    _amount = amount;
    notifyListeners();
  }
  void setDays(int days){
    _days = days;
    notifyListeners();
  }
  void setInterestPayment(String interest){
    _interestPayment = interest;
    notifyListeners();
  }

  void setSavingsTitle(String title){
    _title = title;
    notifyListeners();
  }

  void setInterestRate(double interest){
    _interest = interest;
    notifyListeners();
  }
}