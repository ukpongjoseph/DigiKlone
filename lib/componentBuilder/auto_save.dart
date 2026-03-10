import 'package:flutter/material.dart';
import 'package:second_flutter/pages/auto_save_settings_page.dart';

class AutoSave extends StatefulWidget {
  final double screenWidth;
  final bool isMobile;
  final double spacing;
  const AutoSave({
    super.key,
    required this.isMobile,
    required this.screenWidth,
    required this.spacing,
  });

  @override
  State<AutoSave> createState() => _AutoSaveState();
}

class _AutoSaveState extends State<AutoSave> {
  bool isSwitchedOn = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.spacing * 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSwitchedOn?const Color.fromARGB(255, 148, 214, 150):Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: isSwitchedOn?const Color.fromARGB(255, 133, 193, 135):Colors.grey,
        ),
      ),
      child: Column(
        children: [
          isSwitchedOn?ListTile(
            dense: true,
            minLeadingWidth: 0,
            minTileHeight: 0,
            minVerticalPadding: 0,
            isThreeLine: true,
            horizontalTitleGap: widget.spacing,
            contentPadding: EdgeInsets.all(widget.spacing),
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade400,
              child: Icon(
                Icons.play_circle_outline_outlined,
                color: Colors.green.shade900,
              ),
            ),
            title: Text("Auto-save Active", style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.isMobile?14:16),),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("₦45,000 monthly"),
                Text("Next transfer: Jan 15, 2025", style: TextStyle(fontSize: widget.isMobile?10:12, color: Colors.green.shade700),),
              ],
            ),
            trailing: Switch(
              padding: EdgeInsets.zero,
              activeTrackColor: Colors.blue.shade700,
              value: isSwitchedOn,
              onChanged: (value) {
                setState(() {
                  isSwitchedOn = value;
                });
              },
            ),
          ):GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AutoSaveSettingsPage()));
            },
            child: ListTile(
              dense: true,
              minLeadingWidth: 0,
              minTileHeight: 0,
              minVerticalPadding: widget.spacing,
              horizontalTitleGap: widget.spacing,
              contentPadding: EdgeInsets.all(widget.spacing),
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 143, 208, 146),
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: const Color.fromARGB(255, 61, 138, 66),
                ),
              ),
              title: Text("Setup Auto-save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.isMobile?14:16),),
            ),
          ),
          isSwitchedOn?SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade300,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10)
              )),
              onPressed: (){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Manage Settings", style: TextStyle(color: Colors.green.shade900),),
                Icon(Icons.chevron_right_rounded, color: Colors.green.shade900,)
              ],
            )),
          ): Container()
        ],
      ),
    );
  }
}
