import 'package:flutter/material.dart';

class DigiLockProvider extends ChangeNotifier {
  late int _amount;
  late int _days;
  late String _interestPayment;

  int getAmount()=>_amount;
  int getDays()=>_days;
  String getInterestPayment()=>_interestPayment;

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
}