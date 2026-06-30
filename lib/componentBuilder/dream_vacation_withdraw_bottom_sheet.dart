import 'package:flutter/material.dart';

class DreamVacationWithdrawBottomSheet extends StatefulWidget {
  const DreamVacationWithdrawBottomSheet({super.key});

  @override
  State<DreamVacationWithdrawBottomSheet> createState() => _DreamVacationWithdrawBottomSheetState();
}

class _DreamVacationWithdrawBottomSheetState extends State<DreamVacationWithdrawBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(
      color: Colors.white,
      width: double.infinity,
      height: 300,
    child: Text("Hello Withdraw?"),));
  }
}