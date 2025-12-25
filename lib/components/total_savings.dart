import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/savings_plan.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class TotalSavings extends StatefulWidget {
  const TotalSavings({super.key});

  @override
  State<TotalSavings> createState() => _TotalSavingsState();
}

class _TotalSavingsState extends State<TotalSavings> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 9;
    final Map<String, dynamic> totalSavings = context
        .read<DigiSavingsPlans>()
        .fetchTotalSavings();
    String percentage = totalSavings["percentage"];
    int plans = totalSavings["plans"];
    String interest = totalSavings["interest"];
    String saved = totalSavings["saved"];
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Container(
      padding: isMobile ? EdgeInsets.all(10.0) : EdgeInsets.all(15.0),
      margin: isMobile
          ? EdgeInsets.symmetric(vertical: 20, horizontal: 8)
          : EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Savings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 16 : 20,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                  iconColor: totalSavings["progress_type"] == "increase"
                      ? Colors.green[400]
                      : Colors.red[400],
                  iconSize: isMobile ? 16 : 20,
                ),
                label: totalSavings["progress_type"] == "increase"
                    ? Text(
                        "+$percentage",
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: isMobile ? 12.5 : 18,
                        ),
                      )
                    : Text(
                        "-$percentage",
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: isMobile ? 16 : 18,
                        ),
                      ),
                icon: totalSavings["progress_type"] == "increase"
                    ? Icon(Icons.trending_up_sharp)
                    : Icon(Icons.trending_down),
              ),
            ],
          ),
          SizedBox(height: spacing),
          Text(
            totalSavings["total saved"],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 16 : 20,
            ),
          ),
          Text(
            "Across $plans active savings plans",
            style: TextStyle(fontSize: isMobile ? 12 : 16),
          ),
          SizedBox(height: spacing + 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "This Month",
                    style: TextStyle(fontSize: isMobile ? 11 : 15),
                  ),
                  SizedBox(height: spacing - 4),
                  totalSavings["progress_type"] == "increase"
                      ? Text(
                          "+$saved",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        )
                      : Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Interest Earned",
                    style: TextStyle(fontSize: isMobile ? 11 : 15),
                  ),
                  SizedBox(height: spacing - 4),
                  totalSavings["progress_type"] == "increase"
                      ? Text(
                          "+$interest",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        )
                      : Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
