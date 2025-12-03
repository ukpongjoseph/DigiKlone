import 'package:flutter/material.dart';

// we are creating a class to hold global state data. This class will hold user details such as firstname, lastname, email and user role. We are also making the fields private .
class AuthProvider extends ChangeNotifier{
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _password;
  
  // Since the global states are private, we are setting a getter function to be able to access these states
  String getFName()=>_firstName;
  String getLName()=>_lastName;
  String getEmail()=>_email;
  String getPassword()=>_password;

// Setter function for all field
  void setFName(String firstName){
    _firstName = firstName;
    notifyListeners();
  }
  void setLName(String lastName){
    _lastName = lastName;
    notifyListeners();
  }
  void setEmail(String email){
    _email = email;
    notifyListeners();
  }
  void setPassword(String password){
    _password = password;
    notifyListeners();
  }
}