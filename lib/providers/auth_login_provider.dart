import 'package:flutter/material.dart';

class AuthloginProvider extends ChangeNotifier {
  // variables to hold global states which entails user details
  late String _email;
  late String _firstName;
  late String _lastName;
  late String _role;
  late String _token;
  late String _profilePic;
  late String _bio;
  late String _phoneNumber;
  late String _userId;

// getter functions to fetch or get these variables in any widget needed
  String getEmail()=>_email;
  String getFName()=>_firstName;
  String getLName()=>_lastName;
  String getRole()=>_role;
  String getToken()=>_token;
  String getBio()=>_bio;
  String getPhoneNumber()=>_phoneNumber;
  String getProfilePic()=>_profilePic;
  String getUserId()=>_userId;

    void updateLoggenInUserDetails(Map<String, dynamic> userData){
    _firstName = (userData["firstName"]);
    _lastName = (userData["lastName"]);
    _email = (userData["email"]);
    _role = (userData["role"]);
    _token = (userData["token"]);
    _bio = (userData["bio"]);
    _phoneNumber = (userData["phoneNumber"]);
    _profilePic = (userData["profilePic"]);
    _userId = (userData["userId"]);
    notifyListeners();
  }
}
