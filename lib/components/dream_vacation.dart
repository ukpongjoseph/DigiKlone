import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/dream_vacation_page.dart';
import 'package:second_flutter/theme/app_theme.dart';

class DreamVacation extends StatefulWidget {
  const DreamVacation({super.key});

  @override
  State<DreamVacation> createState() => _DreamVacationState();
}

class _DreamVacationState extends State<DreamVacation> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 7;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DreamVacationPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(spacing * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Colors.green),
          color: theme.colorScheme.surfaceContainerHigh,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dream Vacation",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Dec 31,2024",
                      style: TextStyle(fontSize: isMobile ? 11 : 14),
                    ),
                  ],
                ),
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: isMobile ? 15 : 20,
                ),
              ],
            ),
            SizedBox(height: isMobile ? 8 : 12),
            Row(
              children: [
                Text(
                  "₦325,000",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 17 : 19,
                  ),
                ),
                Text(
                  "  of ₦800,000",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isMobile ? 10 : 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.41,
                    backgroundColor: theme == lightTheme
                        ? const Color.fromARGB(255, 145, 194, 233)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue.shade900,
                    ),
                  ),
                ),
                SizedBox(width: spacing * 3),
                Text(
                  "41%",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: isMobile ? 11 : 13,
                  ),
                ),
              ],
            ),
            Text(
              "Monthly target: ₦45,000",
              style: TextStyle(fontSize: isMobile ? 10 : 12),
            ),
            SizedBox(height: spacing * 2.5),
            Container(
              padding: EdgeInsets.all(spacing * 1.5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: Colors.green),
                color: theme == lightTheme
                    ? const Color.fromARGB(255, 193, 238, 194)
                    : const Color.fromARGB(255, 28, 57, 28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Interest earned : +₦12,500",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: isMobile ? 11 : 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "12% p.a.",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: isMobile ? 11 : 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing * 2),
            Container(
              padding: EdgeInsets.all(spacing),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: Colors.green),
                color: theme == lightTheme
                    ? const Color.fromARGB(255, 193, 238, 194)
                    : const Color.fromARGB(255, 28, 57, 28),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.green.shade700,
                    size: isMobile ? 20 : 23,
                  ),
                  SizedBox(width: spacing),
                  Text(
                    "Auto-save active: ₦45,000 monthly",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: isMobile ? 11 : 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tap to view more details",
                  style: TextStyle(fontSize: isMobile ? 11 : 13),
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.grey,
                  size: isMobile ? 15 : 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
