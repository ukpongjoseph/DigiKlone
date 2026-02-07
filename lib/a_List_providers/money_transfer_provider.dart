import 'package:flutter/material.dart';

class MoneyTransferProvider extends ChangeNotifier {
  late String _beneficiaryName;
  late String _beneficiaryAccountNumber;
  late bool _isFavorite;

  void setBeneficiaryName(String name) {
    _beneficiaryName = name;
    notifyListeners();
  }

  void setBeneficiaryAccountNumber(String accNum) {
    _beneficiaryAccountNumber = accNum;
    notifyListeners();
  }

  void setIsFavorite(bool isFav) {
    _isFavorite = isFav;
    notifyListeners();
  }

  String getBeneficiaryName() => _beneficiaryName;
  String getBeneficiaryAccountNumber() => _beneficiaryAccountNumber;
  bool getIsFavorite() => _isFavorite;

  void setAllInstanceData(String name, String accNum, bool isFav) {
    _beneficiaryAccountNumber = accNum;
    _beneficiaryName = name;
    _isFavorite = isFav;
    notifyListeners();
  }
}
