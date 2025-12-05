import 'package:flutter/material.dart';

class LockFunds extends StatefulWidget {
  const LockFunds({super.key});

  @override
  State<LockFunds> createState() => _LockFundsState();
}

class _LockFundsState extends State<LockFunds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Text("Lock Funds")
        ],
      ),
    );
  }
}