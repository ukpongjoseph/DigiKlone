import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class TargetTopCard extends StatefulWidget {
  const TargetTopCard({super.key});

  @override
  State<TargetTopCard> createState() => _TargetTopCardState();
}

class _TargetTopCardState extends State<TargetTopCard> {

  void displayDigiTargetInfo(){
    showModalBottomSheet(
      isDismissible: false,
      context: context, builder: (BuildContext context){
        ThemeData theme = context.read<ThemeProvider>().getTheme();
      return Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer
        ),
        height: 250,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // first line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("How DigiTaget Works"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close)
                )
              ],
            ),
            SizedBox(height: 10,),
            // ListTiles 
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              minLeadingWidth: 5,
              dense: true,
              minTileHeight: 0,
              leading: Icon(Icons.track_changes, color: Colors.green.shade700,),
              title: Text("Goal-based savings"),
              subtitle: Text("Set specific financial goals and track your progress towards achieving them"),
            ),
            SizedBox(height: 5,),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              minLeadingWidth: 5,
              dense: true,
              minTileHeight: 0,
              leading: Icon(Icons.warning_amber, color: Colors.deepOrange,),
              title: Text("Early Withdrawal Penalty"),
              subtitle: Text("Withdrawing before reaching your goal  incurs a 1.75% penalty to encourage savaings discipline"),
            ),
            SizedBox(height: 5,),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              minLeadingWidth: 5,
              dense: true,
              minTileHeight: 0,
              leading: Icon(Icons.check_circle_outline_outlined, color: Colors.green.shade700),
              title: Text("Auto-save Features"),
              subtitle: Text("Set up automatic transfers to consistently work towards your goal"),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile?5:8;
    return Container(
      padding: EdgeInsets.all(spacing*2),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 39, 93, 41),
        border: Border.all(
          width: 1.5,
          color: Colors.transparent
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          // First Line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 30,),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 87, 167, 89),
                child: Icon(Icons.track_changes_rounded),
              ),
              GestureDetector(
                onTap: () {
                  displayDigiTargetInfo();
                },
                child: CircleAvatar(
                  radius: isMobile? 12:22,
                  backgroundColor: const Color.fromARGB(255, 87, 167, 89),
                  child: Icon(Icons.info_outline, size: isMobile?17:22,),
                ),
              )
            ],
          ),

          SizedBox(height: spacing*2,),
          // Second Line
          Text("Total Progress", style: TextStyle(color: Colors.grey, fontSize: isMobile?11:13),),
          Text("₦1,375,000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile?25:29, color: Colors.white),),
          Text("of ₦3,800,000", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          SizedBox(height: spacing,),
          LinearProgressIndicator(
            value: 0.36,
            valueColor:AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: const Color.fromARGB(255, 124, 183, 126),
            borderRadius: BorderRadius.circular(10),
          ),
          SizedBox(height: spacing,),
          Text("36% Complete", style: TextStyle(fontSize: isMobile?10:13, fontWeight: FontWeight.bold, color: Colors.white),)
        ],
      ),
    );
  }
}