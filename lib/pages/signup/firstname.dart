import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/pages/signup/lastname.dart';
import 'package:second_flutter/a_List_providers/auth_register.dart';


class Firstname extends StatefulWidget {
  const Firstname({super.key});

  @override
  State<Firstname> createState() => _FirstnameState();
}

class _FirstnameState extends State<Firstname> {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
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
            Text("Welcome to Digiklone"),
            SizedBox(height: 40.0),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstName,
                    decoration: InputDecoration(
                      hintText: "First name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      labelText: "Enter your first name"
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalid first name";
                      }
                      else if(value.length < 6){
                        return "first name must be 6 characters or more";
                      }
                      else{
                        Provider.of<AuthProvider>(context, listen: false).setFName(_firstName.text.trim());
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  FilledButton(
                    onPressed: (){
                      setState(() {
                        if(_formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Lastname()));
                        }
                      });
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