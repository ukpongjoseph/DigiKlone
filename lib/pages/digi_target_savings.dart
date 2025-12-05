import 'package:flutter/material.dart';

class DigiTargetSavings extends StatefulWidget {
  const DigiTargetSavings({super.key});

  @override
  State<DigiTargetSavings> createState() => _DigiTargetSavingsState();
}

class _DigiTargetSavingsState extends State<DigiTargetSavings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [Text("Digi target savings")]),
    );
  }
}
