import 'package:flutter/material.dart';

class BeneficiariesProvider extends ChangeNotifier {
  List <Map<String, dynamic>> _beneficiaries = [];

 List <Map<String,dynamic>> fetchBeneficiaries(){
    return _beneficiaries;
 }

 void addBeneficiary(Map<String, dynamic> newBeneficary){
    _beneficiaries.add(newBeneficary);
    ChangeNotifier();
 }

  void deleteAllBeneficiaries(){
    _beneficiaries.clear();
    ChangeNotifier();
  }
}