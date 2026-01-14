import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/digi_save_container.dart';

class DigiSaveBalance extends StatefulWidget {
  const DigiSaveBalance({super.key});

  @override
  State<DigiSaveBalance> createState() => _DigiSaveBalanceState();
}

class _DigiSaveBalanceState extends State<DigiSaveBalance> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5:8;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: theme.colorScheme.surfaceContainerHigh,
        child: Container(
          padding: EdgeInsets.all(spacing *2),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              DigiSaveContainer()
            ],
          ),
        ),
      ),
    );
  }
}
