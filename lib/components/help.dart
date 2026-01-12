import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/support.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Text("Still need help?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile?16:18),),
          SizedBox(height: spacing,),
          Text("Can't find what you're looking for>Our support team is here to help you 24/7", textAlign: TextAlign.center,style: TextStyle(fontSize: isMobile ? 10:12),),
          SizedBox(height: spacing * 3,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
            }, 
          child: Text("Contact Support", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile?12:14, color: Colors.white),))
        ],
      ),
    );
  }
}