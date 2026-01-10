import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text("Contact Support")
      ),
      body: Center(
        child: Text("Support Page, We are here to help you")
      ),
    );
  }
}
