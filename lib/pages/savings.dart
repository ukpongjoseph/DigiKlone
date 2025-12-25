import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/recent_activity.dart';
import 'package:second_flutter/components/savings_card.dart';
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
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surfaceContainerHigh,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Savings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 30 : 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: theme.colorScheme.surfaceContainerHigh,
          child: Column(
            children: [TotalSavings(), SavingsCard(), RecentActivity()],
          ),
        ),
      ),
    );
  }
}
