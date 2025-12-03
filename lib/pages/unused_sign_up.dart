// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:second_flutter/authServices/register.dart';
// import 'package:second_flutter/pages/sign_in.dart';
// import 'package:second_flutter/providers/auth_provider.dart';
// import 'package:provider/provider.dart';


// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   // Creating a unique key for the form
//   final _formKey = GlobalKey<FormState>();
//   // storing all the values of the textfields in a controller variable
//   final _email = TextEditingController();
//   final _firstName = TextEditingController();
//   final _lastName = TextEditingController();
//   final _password = TextEditingController();
//   final _confirmPassword = TextEditingController();
//   // initializing a data to hold a json string that will hold are all form values
//   late String data;
//   // creating a snackBar
//   final snackDemo = SnackBar(
//     content: Text(
//       "Error Signing Up",
//       style: TextStyle(
//         color: Colors.white
//       ),
//     ),
//     backgroundColor: Color.fromARGB(255, 1, 8, 80),
//     padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
//     behavior: SnackBarBehavior.floating,
//     // setting a timer for the snackBar
//     duration: Duration(seconds: 2),
//   );
//   // This function calls the register function that makes an api call to the register endpoint
//   void handleRegister()async{
//     // if all form fields are validated parse all form field values into a json string
//     if(_formKey.currentState!.validate()){
//       data = jsonEncode({
//         "email" : _email.text.trim(),
//         "firstName" : _firstName.text.trim(),
//         "lastName" : _lastName.text.trim(),
//         "password" : _password.text.trim()
//       });
//       // making an api call and storing the values in a variable called authResult
//       final authResult = await AuthServices().register(data);
//       // Future or async await functions or methods do not go well with build context (after the function call, the widget may not exist in the wwidget tree. so we check if the widget is mounted before using the build context. if the widget is not mounted on the widget tree, we return or stop the flow else if mounted we use thebuild context). To combat this problem, i use the mounted getter to handle it
//       if(!mounted)return;
//       // if success message/status is true we reset the form, access the global state and update it with the registerd user details and then navigate to the landing page
//        if(authResult["success"] == true){
//         _formKey.currentState!.reset();
//         Provider.of<AuthProvider>(context, listen:false).updateUserDetails(authResult["user"]);
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
//       }else{
//         // if we don't get a success message, we display a snack bar showing the error
//         ScaffoldMessenger.of(context).showSnackBar(snackDemo);
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlueAccent,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(
//           "Sign Up",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,

//           ),
//           ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Text(
//                 "Sign Up Page",
//                 style: TextStyle(
//                   color: const Color.fromARGB(255, 0, 6, 70),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30.0
//                 ),
//               ),
//               Form(
//                 key: _formKey,
//                 autovalidateMode: AutovalidateMode.onUnfocus,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _firstName,
//                       decoration: InputDecoration(
//                         labelText: "Enter your Firstname",
//                         hintText: "first name",
//                         border: OutlineInputBorder()
//                       ),
//                       validator: (value){
//                         if(value == null || value.isEmpty){
//                           return "Firstname cannot be empty";
//                         }else if(value.length < 6){
//                           return "Firstname should more than 6 characters";
//                         }else{
//                           return null;
//                         }
//                       },
//                     ),
//                     SizedBox(height: 10.0,),
//                     TextFormField(
//                       controller: _lastName,
//                       decoration: InputDecoration(
//                         labelText: "Enter your Last name",
//                         hintText: "last name",
//                         border: OutlineInputBorder()
//                       ),
//                         validator: (value){
//                         if(value == null || value.isEmpty){
//                           return "Lastname cannot be empty";
//                         }else if(value.length < 6){
//                           return "Lastname should more than 6 characters";
//                         }else{
//                           return null;
//                         }
//                       },
//                     ),
//                     SizedBox(height: 10.0,),
//                     TextFormField(
//                       controller: _email,
//                       decoration: InputDecoration(
//                         labelText: "Enter your email address",
//                         hintText: "email address",
//                         border: OutlineInputBorder()
//                       ),
//                       validator: (value){
//                         if(value == null || value.isEmpty){
//                           return "E-mail cannot be empty";
//                         }else if(!value.contains("@")){
//                           return "Invalid Email address";
//                         }else{
//                           return null;
//                         }
//                       },
//                     ),
//                     SizedBox(height: 10.0,),
//                     TextFormField(
//                       controller: _password,
//                       decoration: InputDecoration(
//                         labelText: "Enter your password",
//                         hintText: "password",
//                         border: OutlineInputBorder()
//                       ),
//                         validator: (value){
//                         if(value == null || value.isEmpty){
//                           return "Password cannot be empty";
//                         }else if(value.length < 6){
//                           return "Password should more than 6 characters";
//                         }else{
//                           return null;
//                         }
//                       },
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 10.0,),
//                     TextFormField(
//                       controller: _confirmPassword,
//                       decoration: InputDecoration(
//                         labelText: "confirm your password",
//                         hintText: "confirm password",
//                         border: OutlineInputBorder()
//                       ),
//                         validator: (value){
//                         if(value == null || value.isEmpty){
//                           return "Password cannot be empty";
//                         }else if(value.length < 6){
//                           return "Password should more than 6 characters";
//                         }else if(value != _password.text.trim()){
//                           return "Password Mismatch";
//                         }
//                         else{
//                           return null;
//                         }
//                       },
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 10.0,),
//                      FilledButton(
//                       onPressed: (){
//                         // this function is called when the submit button is clicked
//                         handleRegister();
//                       }, 
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 40.0,
//                           vertical: 20.0,
//                         ),
//                         backgroundColor: const Color.fromARGB(255, 0, 6, 70)
//                       ),
//                       child: Text('Submit'),
//                     ),
//                   ],
//                 )
//               )
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }