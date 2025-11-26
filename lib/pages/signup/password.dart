import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/pages/signup/confirm_password.dart';
import 'package:second_flutter/Authproviders/auth_register.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
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
            SizedBox(height: 40.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      label: Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalid Password";
                      }else if(value.length < 6){
                        return "Password must be a minimum of 6 characters";
                      }else{
                        Provider.of<AuthProvider>(context, listen: false).setPassword(_password.text.trim());
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  FilledButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPassword()));
                      }
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
                      "Next",
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