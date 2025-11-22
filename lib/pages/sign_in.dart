import 'dart:convert';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  dynamic handleLogin()async{
    late String data;
    data = jsonEncode({
      "email" : _email,
      "password" : _password
    });
    if(_formKey.currentState!.validate()){

      
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
      body: Column(
        children: [
          Text("LogIn Page"),
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
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    labelText: "Enter your email address"
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
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 6, 70),
                    padding: EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 20.0
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    )
                  ),
                  child: Text("Login")
                )
              ],
            )
          )
        ],
      ),
    );
  }
}