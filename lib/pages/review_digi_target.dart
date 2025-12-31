import 'package:flutter/material.dart';

class ReviewDigitarget extends StatefulWidget {
  const ReviewDigitarget({super.key});

  @override
  State<ReviewDigitarget> createState() => _ReviewDigitargetState();
}

class _ReviewDigitargetState extends State<ReviewDigitarget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Your DigiTarget"),
        actions: [Icon(Icons.close)],
      ),
      body: Center(child: Text("Review Your Target Savings Plans")),
    );
  }
}
