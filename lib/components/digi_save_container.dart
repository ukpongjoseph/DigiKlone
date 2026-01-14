import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class DigiSaveContainer extends StatefulWidget {
  const DigiSaveContainer({super.key});

  @override
  State<DigiSaveContainer> createState() => _DigiSaveContainerState();
}

class _DigiSaveContainerState extends State<DigiSaveContainer> {
  @override
  Widget build(BuildContext context) {
    int cycle = 2;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5:8;
    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(spacing*4),
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: spacing *5,),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 175, 187, 242),
                      child: Icon(Icons.savings_outlined, color: Colors.white,size: isMobile ? 30 : 40,),
                    ),
                    CircleAvatar(
                      radius: isMobile ? 13: 20,
                      backgroundColor: const Color.fromARGB(255, 175, 187, 242),
                      child: Icon(Icons.info_outline, color: Colors.white,)
                    )
                  ],
                ),
                SizedBox(height: spacing,),
                Text("DigiSave Balance", style: TextStyle(color: Colors.grey[100]),),
                Text("₦45,000"),
                SizedBox(height: spacing,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      TextButton.icon(
                        onPressed: (){}, 
                        icon: Icon(Icons.trending_up_rounded, color: Colors.green,),
                        label: Text("Interest Accrued", style: TextStyle(color: Colors.grey[100]),), 
                      ),
                      SizedBox(height: spacing,),
                      Text("+₦1,250.75"),
                      Text("12.5% p.a.", style: TextStyle(color: Colors.grey[100]),)
                    ],
                  ),
                ),
                SizedBox(height: spacing,),
                Text("Current Cycle : $cycle of 3"),
                SizedBox(height: spacing,),
                LinearProgressIndicator(
                  value: (cycle/3),
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Colors.blue[400],
                ),
                Text("Next withdrawal: Jan 15, 2025", style: TextStyle(color: Colors.grey[100]),)
              ],
            ),
          ),
          SizedBox(height: spacing * 2,),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("+  Quick Save")),
                ElevatedButton(onPressed: (){}, child: Text("+  Quick Save")),
              ],
            ),
          )
        ],
      ),
    );
  }
}