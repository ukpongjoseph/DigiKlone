// import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServices{
  Future<dynamic> register(String param) async{
    try {
      var baseUri = "http://localhost:5000/api/v1/auth/register";
      final response = await http.post(
        Uri.parse(baseUri),
        headers: {"Content-Type" : "application/json"},
        body : param
      );
      if(response.statusCode == 200){
        print(response.body);
        print(response.body.toString());
        print(response.statusCode);
        Map<String, dynamic> authResponse = jsonDecode(response.body);
        return response.statusCode;
      }else{
        throw "error";
      }
    } catch (e) {
      return "Network error : $e";
    }

  }

}