import 'package:flutter/material.dart';

class DreamVacationPage extends StatefulWidget {
  const DreamVacationPage({super.key});

  @override
  State<DreamVacationPage> createState() => _DreamVacationPageState();
}

class _DreamVacationPageState extends State<DreamVacationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Dream vacation Page"),
      ),
    );
  }
}