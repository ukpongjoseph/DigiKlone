import 'dart:convert';

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  var data;
  void handleLogin(){
    if(_formKey.currentState!.validate()){
      print("Valid form");
      // print("The values sent to the backend are ${_email.text.trim()}, ${_firstName.text.trim()}, ${_lastName.text.trim()}, ${_password.text.trim()}, ${_confirmPassword.text.trim()},");
      data = jsonEncode({
        "email" : _email.text.trim(),
        "firstName" : _firstName.text.trim(),
        "lastName" : _lastName.text.trim(),
        "password" : _password.text.trim()
      });
      print(data);
       _formKey.currentState!.reset();
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
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,

          ),
          ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Sign Up Page",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 6, 70),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstName,
                      decoration: InputDecoration(
                        labelText: "Enter your Firstname",
                        hintText: "first name",
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Firstname cannot be empty";
                        }else if(value.length < 6){
                          return "Firstname should more than 6 characters";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: _lastName,
                      decoration: InputDecoration(
                        labelText: "Enter your Last name",
                        hintText: "last name",
                        border: OutlineInputBorder()
                      ),
                        validator: (value){
                        if(value == null || value.isEmpty){
                          return "Lastname cannot be empty";
                        }else if(value.length < 6){
                          return "Lastname should more than 6 characters";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: "Enter your email address",
                        hintText: "email address",
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "E-mail cannot be empty";
                        }else if(!value.contains("@")){
                          return "Invalid Email address";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        labelText: "Enter your password",
                        hintText: "password",
                        border: OutlineInputBorder()
                      ),
                        validator: (value){
                        if(value == null || value.isEmpty){
                          return "Password cannot be empty";
                        }else if(value.length < 6){
                          return "Password should more than 6 characters";
                        }else{
                          return null;
                        }
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      controller: _confirmPassword,
                      decoration: InputDecoration(
                        labelText: "confirm your password",
                        hintText: "confirm password",
                        border: OutlineInputBorder()
                      ),
                        validator: (value){
                        if(value == null || value.isEmpty){
                          return "Password cannot be empty";
                        }else if(value.length < 6){
                          return "Password should more than 6 characters";
                        }else if(value != _password.text.trim()){
                          return "Password Mismatch";
                        }
                        else{
                          return null;
                        }
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0,),
                     FilledButton(
                      onPressed: (){
                        handleLogin();
                      }, 
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 20.0,
                        ),
                        backgroundColor: const Color.fromARGB(255, 0, 6, 70)
                      ),
                      child: Text('Submit'),
                    ),
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }
}