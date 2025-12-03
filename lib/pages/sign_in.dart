import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/authServices/login.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/a_List_providers/auth_login_provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool submitting = false;
  final snackDemo = SnackBar(
    content: Text(
      "Error Signing In",
      style: TextStyle(
        color: Colors.white
      ),
    ),
    backgroundColor: Color.fromARGB(255, 1, 8, 80),
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
    behavior: SnackBarBehavior.floating,
    // setting a timer for the snackBar
    duration: Duration(seconds: 2),
  );
  void handleLogin()async{
    String data = jsonEncode({
      "email" : _email.text.trim(),
      "password" : _password.text.trim()
    });
    if(_formKey.currentState!.validate()){
      setState(() {
        submitting = true;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LandingPage()));
      final loginResponse = await LoginService().login(data);
      if(!mounted)return;
      if(loginResponse["success"] == true){
        Provider.of<AuthloginProvider>(context, listen: false).updateLoggenInUserDetails(loginResponse["body"]);
        _formKey.currentState!.reset();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LandingPage()));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(snackDemo);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,

          ),
          ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(30.0, 10.0, 30.0, 10.0)
            ),
            Text(
              "LogIn Page",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 6, 70),
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),
            ),
            SizedBox(height: 60.0),
            Form(
              key: _formKey,
              child:Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      labelText: "Enter your email address"
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalid email address";
                      }else if(!value.contains("@")){
                        return "Invalid email address";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                      hintText: "password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      labelText: "Enter your password"
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Password field cannot be empty";
                      }else if(value.length<6){
                        return "Password should be a minimum of 6 characters";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 40.0),
                  FilledButton(
                    onPressed: (){
                      handleLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 6, 70),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)
                      )
                    ),
                    child: submitting?Text(
                      "Logging in...",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.0
                      ),
                    ):Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3.0
                      ),
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}