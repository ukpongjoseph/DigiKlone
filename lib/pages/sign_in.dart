import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/authServices/login.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/a_List_providers/auth_login_provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late ThemeData _theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Provider.of<ThemeProvider>(context).getTheme();
  }

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool submitting = false;
  bool isButtonEnabled = true;
  void handleLogin() async {
    final snackDemo = SnackBar(
      content: Text(
        "Error Signing In",
        style: TextStyle(color: _theme.colorScheme.surface),
      ),
      backgroundColor: _theme.colorScheme.primary,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      behavior: SnackBarBehavior.floating,
      // setting a timer for the snackBar
      duration: Duration(seconds: 2),
    );
    String data = jsonEncode({
      "email": _email.text.trim(),
      "password": _password.text.trim(),
    });
    if (_formKey.currentState!.validate()) {
      setState(() {
        submitting = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
      final loginResponse = await LoginService().login(data);
      if (!mounted) return;
      if (loginResponse["success"] == true) {
        Provider.of<AuthloginProvider>(
          context,
          listen: false,
        ).updateLoggenInUserDetails(loginResponse["body"]);
        _formKey.currentState!.reset();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LandingPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackDemo);
      }
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
            color: theme.colorScheme.surface,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "Sign In",
          style: TextStyle(
            color: theme.colorScheme.surface,
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
              padding: EdgeInsetsGeometry.fromLTRB(30.0, 10.0, 30.0, 10.0),
            ),
            Text(
              "LogIn Page",
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 60.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      labelText: "Enter your email address",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Invalid email address";
                      } else if (!value.contains("@")) {
                        return "Invalid email address";
                      } else {
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
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      labelText: "Enter your password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password field cannot be empty";
                      } else if (value.length < 6) {
                        return "Password should be a minimum of 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 40.0),
                  FilledButton(
                    onPressed: () {
                      handleLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: submitting
                        ? Text(
                            "Logging in...",
                            style: TextStyle(
                              color: theme.colorScheme.surface,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                            ),
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: theme.colorScheme.surface,
                              fontSize: 20.0,
                              letterSpacing: 3.0,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
