import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
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
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter your Firstname",
                        hintText: "first name",
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value == null){
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
                      decoration: InputDecoration(
                        labelText: "Enter your Last name",
                        hintText: "last name",
                        border: OutlineInputBorder()
                      ),
                        validator: (value){
                        if(value == null){
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
                      decoration: InputDecoration(
                        labelText: "Enter your email address",
                        hintText: "email address",
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value == null){
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
                      decoration: InputDecoration(
                        labelText: "Enter your password",
                        hintText: "password",
                        border: OutlineInputBorder()
                      ),
                        validator: (value){
                        if(value == null){
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
                     FilledButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          print("Valid form");
                          _formKey.currentState!.reset();
                        }
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