// importing the convert package to convert between json and string using jsonEncode and jsonDecode
import 'dart:convert';

// importing the http package to be able to make api call
import 'package:http/http.dart' as http;

// creating a class that will hold auth functions like register and login
class AuthServices{
  // a register function that returns dynamic data. This function takes in a json string gotten from jsonEncode(which converts user data into a json string)
  Future<dynamic> register(String param) async{
    try {
      // storing our api endpoint in a variable
      var baseUri = "http://localhost:5000/api/v1/auth/register";
      // making an api call to the end point and storing the reposne in a variable called response
      final response = await http.post(
        Uri.parse(baseUri),
        headers: {"Content-Type" : "application/json"},
        body : param
      );
      // if response status is sucessful, we perform a certain action else we throw an error and display the error to the user
      if(response.statusCode == 200){
        // when making api calls in flutter, the response is usually a json string. so we use jsonDecode to convert this json string to an object like data structure and store this result in a variable called authResponse
        Map<String, dynamic> authResponse = jsonDecode(response.body);
        // returning response
        return authResponse;
      }else{
        throw "error";
      }
    } catch (e) {
      return {
        "success" : false,
        "message" : "Network error : $e"
      };
    }

  }

}