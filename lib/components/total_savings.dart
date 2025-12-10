import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/savings_plan.dart';

class TotalSavings extends StatefulWidget {
  const TotalSavings({super.key});

  @override
  State<TotalSavings> createState() => _TotalSavingsState();
}

class _TotalSavingsState extends State<TotalSavings> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 9;
    final Map<String, dynamic> totalSavings = context.read<DigiSavingsPlans>().fetchTotalSavings();
    return Container(
      padding: isMobile ? EdgeInsets.all(10.0) : EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            blurRadius: 3.0,
            spreadRadius: 3.0,
            offset: Offset(3.0, 3.0)
          )
        ],
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        
      ),
    );
  }
}