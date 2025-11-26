import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/authServices/register.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/Authproviders/auth_register.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final _formKey = GlobalKey<FormState>();
  final _confirmPassword = TextEditingController();
  late String data;
  void handleRegister()async{
    if(_formKey.currentState!.validate()){
      data = jsonEncode({
        "email" : Provider.of<AuthProvider>(context, listen: false).getEmail(),
        "firstName" : Provider.of<AuthProvider>(context, listen: false).getFName(),
        "lastName" : Provider.of<AuthProvider>(context, listen: false).getLName(),
        "password" : Provider.of<AuthProvider>(context, listen: false).getPassword(),
      });
    }
    final registerResponse = await AuthServices().register(data);
    if(!mounted)return;
    if(registerResponse["success"] == true){
      _formKey.currentState!.reset();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DigiKlone"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: Column(
          children: [
            Text("Welcome to DigiKlone"),
            SizedBox(height: 30.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: _confirmPassword,
                    decoration: InputDecoration(
                      hintText: "confirm your password",
                      label: Text("Confirm Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Field cannot be empty";
                      }else if(value != Provider.of<AuthProvider>(context, listen: false).getPassword()){
                        return "Password Mismatch";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  FilledButton(
                    onPressed: (){
                      handleRegister();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0
                      ),
                      backgroundColor: const Color.fromARGB(255, 0, 6, 70)
                    ), 
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
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