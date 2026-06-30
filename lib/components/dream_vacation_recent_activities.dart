import 'package:flutter/material.dart';

class DreamVacationRecentActivities extends StatefulWidget {
  final double screenWidth;
  final double spacing;
  final bool isMobile;
  const DreamVacationRecentActivities({
    super.key,
    required this.isMobile,
    required this.screenWidth,
    required this.spacing,
  });

  @override
  State<DreamVacationRecentActivities> createState() =>
      _DreamVacationRecentActivitiesState();
}

class _DreamVacationRecentActivitiesState
    extends State<DreamVacationRecentActivities> {

  @override
  Widget build(BuildContext context) {
      List<Map<String, dynamic>> activities = [
    {
      "icon":Icons.add,
      "title":"Deposit",
      "time":"2 days ago",
      "value":"₦50,000",
      "color":const Color.fromARGB(255, 187, 240, 245),
      "main":Colors.blue.shade900
    },
    {
      "icon":Icons.calendar_today_outlined,
      "title":"Auto-save",
      "time":"1 week ago",
      "value":"₦45,000",
      "color":const Color.fromARGB(255, 204, 246, 198),
      "main":Colors.green.shade900
    }
  ];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.5, color: Colors.grey),
      ),
      child: Column(
        children: [
          ...activities.map((e) {
            return Column(
              children: [
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.all(widget.spacing * 2),
                  minLeadingWidth: 0,
                  minTileHeight: widget.spacing,
                  minVerticalPadding: 0,
                  horizontalTitleGap: widget.spacing,
                  leading: CircleAvatar(
                    backgroundColor: e["color"],
                    child: Icon(e["icon"], color: e["main"],),
                  ),
                  title: Text(e["title"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.isMobile?13:15),),
                  subtitle: Text(e["time"], style: TextStyle(fontSize: widget.isMobile?10:12),),
                  trailing: Text("+${e["value"]}", style: TextStyle(fontSize: widget.isMobile?11:13, color:Colors.green, fontWeight: FontWeight.bold),),
                ),
                activities.last!=e?Divider(color: Colors.grey,):Container()
              ],
            );
          },)
        ],
      ),
    );
  }
}
