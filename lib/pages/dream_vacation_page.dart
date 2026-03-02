import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class DreamVacationPage extends StatefulWidget {
  const DreamVacationPage({super.key});

  @override
  State<DreamVacationPage> createState() => _DreamVacationPageState();
}

class _DreamVacationPageState extends State<DreamVacationPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth<600;
    double spacing = isMobile?5:8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dream Vacation",style: TextStyle(fontSize: isMobile?17:19,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings_outlined, color: theme == lightTheme? Colors.black:Colors.white,))
        ],
      ),
      body: Container(
        decoration : BoxDecoration(),
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}