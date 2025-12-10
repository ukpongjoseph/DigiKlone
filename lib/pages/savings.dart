import 'package:flutter/material.dart';
import 'package:second_flutter/components/total_savings.dart';

class Savings extends StatefulWidget {
  const Savings({super.key});

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Savings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 20 : 30,
            ),
          ),
        ),
        body: Column(
          children: [
            TotalSavings(),
            
          ],
        ),
      ),
    );
  }
}
