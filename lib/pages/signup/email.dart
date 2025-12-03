import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/pages/signup/password.dart';
import 'package:second_flutter/a_List_providers/auth_register.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
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
            Text("Welcome to DigiKloone"),
            SizedBox(height: 30.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "Enter your email address",
                      label: Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalid email address";
                      }else if(!value.contains("@")){
                        return "Invalid email address";
                      }else{
                        Provider.of<AuthProvider>(context, listen: false).setEmail(_email.text.trim());
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  FilledButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Password()));
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