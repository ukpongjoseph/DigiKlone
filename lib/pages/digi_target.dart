import 'package:flutter/material.dart';

class DigiTarget extends StatefulWidget {
  const DigiTarget({super.key});

  @override
  State<DigiTarget> createState() => _DigiTargetState();
}

class _DigiTargetState extends State<DigiTarget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [Text("Digi Target page")]),
    );
  }
}
