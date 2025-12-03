
import 'package:flutter/material.dart';
import 'package:second_flutter/pages/activity.dart';
import 'package:second_flutter/pages/landing_home.dart';
import 'package:second_flutter/pages/profile.dart';
import 'package:second_flutter/pages/savings.dart';
import 'package:second_flutter/pages/wallet.dart';

class NavProvider extends ChangeNotifier {
  int _currentPageIndex = 1;
  final  List _pages = [
    LandingHome(),
    Savings(),
    Wallet(),
    Activity(),
    Profile()
  ];
  void setCurrentPage(int value){
    _currentPageIndex = value;
    notifyListeners();
  }
  int getCurrentPage(){
    return _currentPageIndex;
  }

  List getPages(){
    return _pages;
  }
}