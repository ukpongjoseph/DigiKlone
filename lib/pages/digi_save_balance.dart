import 'package:flutter/material.dart';

class DigiSaveBalance extends StatefulWidget {
  const DigiSaveBalance({super.key});

  @override
  State<DigiSaveBalance> createState() => _DigiSaveBalanceState();
}

class _DigiSaveBalanceState extends State<DigiSaveBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(),
      body: Column(children: [Text("Digi save balance")]),
    );
  }
}
