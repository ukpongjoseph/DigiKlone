//package for converting between JSON object and JSON string
import 'dart:convert';
// importing http package for making api call
import 'package:http/http.dart' as http;

// class to hold auth service for login
class LoginService{
  // declaring a login function
  Future<dynamic> login(String param) async{
    try {
      // storing the base url in a variable
      final baseUri = "http://localhost:5000/api/v1/auth/login";
      // making the api call and storing the result in a variable
      final loginResponse = await http.post(
        Uri.parse(baseUri),
        headers: {"Content-Type" : "application/json"},
        body : param
      );
      if(loginResponse.statusCode == 200){
        Map<String, dynamic> authResponse = jsonDecode(loginResponse.body);
        return authResponse;
      }else{
        throw "error";
      }
    } catch (e) {
      return ("Network error : $e");
    }
  }

}