import 'package:flutter/material.dart';

// we are creating a class to hold global state data. This class will hold user details such as firstname, lastname, email and user role. We are also making the fields private .
class AuthProvider extends ChangeNotifier{
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _role;
  
  // Since the global states are private, we are setting a getter function to be able to access these states
  String getFName()=>_firstName;
  String getLName()=>_lastName;
  String getEmail()=>_email;
  String getRole()=>_role;

// after a successful login, we pass the api response with user details to the functiion. From the function, we extract the necessary user details such as firstname, lastname, email and user role
  void updateUserDetails(Map<String, dynamic> userData){
    _firstName = (userData["firstName"]);
    _lastName = (userData["lastName"]);
    _email = (userData["email"]);
    _role = (userData["role"]);
    notifyListeners();
  }
}