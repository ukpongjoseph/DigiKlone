import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BankAccountTiles extends StatefulWidget {
  const BankAccountTiles({super.key});

  @override
  State<BankAccountTiles> createState() => _BankAccountTilesState();
}

class _BankAccountTilesState extends State<BankAccountTiles> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Column(
      children: [
        DottedBorder(
          options: const RoundedRectDottedBorderOptions(
            padding: EdgeInsets.zero,
            radius: Radius.circular(10),
            color: Colors.grey,
          ),
          child: ListTile(
            horizontalTitleGap: 5,
            dense: true,
            minVerticalPadding: 2,
            leading: CircleAvatar(
              backgroundColor: Colors.green[100],
              child: Icon(Icons.wallet, color: Colors.green.shade900),
            ),
            title: Row(
              children: [
                Text(
                  "Access bank PLC",
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: spacing * 0.5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Direct debit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 9 : 11,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
                Icon(Icons.fiber_manual_record, size: 6),
                Text(
                  "****2468",
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
              ],
            ),
            trailing: Icon(Icons.more_horiz),
          ),
        ),
        SizedBox(height: spacing),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            horizontalTitleGap: 5,
            dense: true,
            minVerticalPadding: 0,
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Icon(Icons.apartment, color: Colors.blue.shade900),
            ),
            title: Text(
              "First Bank of Nigeria",
              style: TextStyle(
                fontSize: isMobile ? 13 : 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
                Icon(Icons.fiber_manual_record, size: 6),
                Text(
                  "****6789",
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
              ],
            ),
            trailing: Icon(Icons.more_horiz),
          ),
        ),
      ],
    );
  }
}
