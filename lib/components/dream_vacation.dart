import 'package:flutter/material.dart';

class DreamVacation extends StatefulWidget {
  const DreamVacation({super.key});

  @override
  State<DreamVacation> createState() => _DreamVacationState();
}

class _DreamVacationState extends State<DreamVacation> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 7;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(spacing * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Colors.green),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Dream Vacation"), Text("Dec 31,2024")],
                ),
                Icon(Icons.settings),
              ],
            ),
            Row(children: [Text("₦325,000,"), Text("of ₦800,000")]),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.41,
                    borderRadius: BorderRadius.circular(10),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue.shade700,
                    ),
                  ),
                ),
                SizedBox(width: spacing*3,),
                Text("41%"),
              ],
            ),
            Text("Monthly target: ₦45,000"),
            Container(
              padding: EdgeInsets.all(spacing),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: Colors.green),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Interest earned : +₦12,500"),
                  Text("12% p.a."),
                ],
              ),
            ),
            SizedBox(height: spacing*2,),
            Container(
              padding: EdgeInsets.all(spacing),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: Colors.green),
              ),
              child: Row(
                children: [
                  Icon(Icons.play_circle_outline_outlined),
                  Text("Auto-save active: ₦45,000 monthly")
                ],
              )
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tap to view more details"),
                Icon(Icons.chevron_right_outlined)
              ],
            )
          ],
        ),
      ),
    );
  }
}
