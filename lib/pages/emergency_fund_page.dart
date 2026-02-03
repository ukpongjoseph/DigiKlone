import 'package:flutter/material.dart';

class EmergencyFundPage extends StatefulWidget {
  const EmergencyFundPage({super.key});

  @override
  State<EmergencyFundPage> createState() => _EmergencyFundPageState();
}

class _EmergencyFundPageState extends State<EmergencyFundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Emergency Fund Page"),
      ),
    );
  }
}