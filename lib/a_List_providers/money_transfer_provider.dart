import 'package:flutter/material.dart';

class MoneyTransferProvider extends ChangeNotifier {
  late String _beneficiaryName;
  late String _beneficiaryAccountNumber;
  late bool _isFavorite;
  late String _transferDescription;
  late String _transferAmount;

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

  void setTransferDescription(String description) {
    _transferDescription = description;
    notifyListeners();
  }

  void setTransferAmount(String amount) {
    _transferAmount = amount;
    notifyListeners();
  }

  String getBeneficiaryName() => _beneficiaryName;
  String getBeneficiaryAccountNumber() => _beneficiaryAccountNumber;
  bool getIsFavorite() => _isFavorite;
  String getTransferDescription() => _transferDescription;
  String getTransferAmount() => _transferAmount;

  void setAllInstanceData(String name, String accNum, bool isFav) {
    _beneficiaryAccountNumber = accNum;
    _beneficiaryName = name;
    _isFavorite = isFav;
    notifyListeners();
  }
}
