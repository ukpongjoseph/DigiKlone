import 'package:flutter/material.dart';

class DreamVacationDepositModalsheet extends StatefulWidget {
  const DreamVacationDepositModalsheet({super.key});

  @override
  State<DreamVacationDepositModalsheet> createState() => _DreamVacationDepositModalsheetState();
}

class _DreamVacationDepositModalsheetState extends State<DreamVacationDepositModalsheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(
      color: Colors.white,
      width: double.infinity,
      height: 300,
    child: Text("Hello Deposit?"),));;
  }
}