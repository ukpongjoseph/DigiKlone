import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/dream_vacation.dart';
import 'package:second_flutter/components/target_top_card.dart';
import 'package:second_flutter/pages/dream_vacation_page.dart';
import 'package:second_flutter/pages/emergency_fund_page.dart';
import 'package:second_flutter/pages/new_car_page.dart';
import 'package:second_flutter/theme/app_theme.dart';

class DigiTarget extends StatefulWidget {
  const DigiTarget({super.key});

  @override
  State<DigiTarget> createState() => _DigiTargetState();
}

class _DigiTargetState extends State<DigiTarget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 27, 74, 33)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                const Color.fromARGB(255, 27, 74, 33),
                const Color.fromARGB(255, 23, 63, 28),
                const Color.fromARGB(255, 18, 55, 22),
                const Color.fromARGB(255, 32, 67, 36),
                const Color.fromARGB(255, 16, 39, 44),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TargetTopCard(),
              SizedBox(height: 10),
              Text(
                "Track your progress",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("3 active goals", style: TextStyle(color: Colors.grey)),
              // DreamVacation(),
              customTargetCards(
                "Dream Vacation",
                "Dec 31,2024",
                "325,000",
                "800,000",
                "45,000",
                0.41,
                Colors.blue.shade900,
                true,
                DreamVacationPage(),
                "monthly",
                "45,000",
                "12,500",
                const Color.fromARGB(255, 145, 194, 233),
              ),
              customTargetCards(
                "Emergency Fund",
                "Dec 31,2024",
                "200,000",
                "500,000",
                "35,000",
                0.40,
                const Color.fromARGB(255, 161, 13, 13),
                false,
                EmergencyFundPage(),
                "weekly",
                "30,000",
                "8,300",
                const Color.fromARGB(255, 233, 145, 145),
              ),
              customTargetCards(
                "New car",
                "Jun 30,2025",
                "850,000",
                "2,500,000",
                "100,000",
                0.34,
                const Color.fromARGB(255, 13, 161, 40),
                true,
                NewCarPage(),
                "weekly",
                "25,000",
                "28,750",
                const Color.fromARGB(255, 170, 233, 145),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTargetCards(
    String title,
    String date,
    String amount,
    String total,
    String target,
    double linearIndicatorValue,
    Color colorValue,
    bool isAutoSaveActive,
    Widget page,
    String targetFrequency,
    String targetValue,
    String interestValue,
    Color indicatorBackgroundColor,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 7;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
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
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(date, style: TextStyle(fontSize: isMobile ? 11 : 14)),
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
                  "₦$amount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 17 : 19,
                  ),
                ),
                Text(
                  "  of ₦$total",
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
                    value: linearIndicatorValue,
                    backgroundColor: theme == lightTheme
                        ? indicatorBackgroundColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    valueColor: AlwaysStoppedAnimation<Color>(colorValue),
                  ),
                ),
                SizedBox(width: spacing * 3),
                Text(
                  "${linearIndicatorValue * 100}%",
                  style: TextStyle(
                    color: colorValue,
                    fontSize: isMobile ? 11 : 13,
                  ),
                ),
              ],
            ),
            Text(
              "Monthly target: ₦$targetValue",
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
                    "Interest earned : +₦$interestValue",
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
            isAutoSaveActive
                ? Container(
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
                          "Auto-save active: ₦$targetValue $targetFrequency",
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: isMobile ? 11 : 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
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
