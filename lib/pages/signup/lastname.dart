import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/pages/signup/email.dart';
import 'package:second_flutter/Authproviders/auth_register.dart';

class Lastname extends StatefulWidget {
  const Lastname({super.key});

  @override
  State<Lastname> createState() => _LastnameState();
}

class _LastnameState extends State<Lastname> {
  final _formKey = GlobalKey<FormState>();
  final _lastname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DigiKlone"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Text("Welcome to DigiKlone"),
            SizedBox(height: 40.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _lastname,
                    decoration: InputDecoration(
                      hintText: "Last name",
                      label: Text("Enter your last name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalid last name";
                      }else if(value.length < 6){
                        return "Last name must be of 6 characters or more";
                      }else{
                        Provider.of<AuthProvider>(context, listen: false).setLName(_lastname.text.trim());
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  FilledButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Email()));
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