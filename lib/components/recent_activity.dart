import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/savings_plan.dart';
import 'package:intl/intl.dart';

class RecentActivity extends StatefulWidget {
  const RecentActivity({super.key});

  @override
  State<RecentActivity> createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    final recentActivity = context
        .read<DigiSavingsPlans>()
        .fetchRecentActivities();
    return Container(
      margin: isMobile
          ? EdgeInsets.symmetric(vertical: 10, horizontal: 10)
          : EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: isMobile ? 14 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("View All", style: TextStyle(fontSize: isMobile ? 12 : 15)),
            ],
          ),
          SizedBox(height: spacing),
          ...recentActivity.map((activity) {
            return Container(
              padding: isMobile
                  ? EdgeInsets.symmetric(vertical: spacing)
                  : EdgeInsets.symmetric(vertical: spacing * 2),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: activity["type"] == "savings"
                                    ? activity["color1"]
                                    : activity["color"],
                                child: activity["type"] == "savings"
                                    ? Icon(
                                        Icons.savings_outlined,
                                        color: Colors.blue,
                                      )
                                    : activity["type"] == "lock"
                                    ? Icon(
                                        Icons.trending_up,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.track_changes_sharp,
                                        color: Colors.green,
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(width: spacing),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity["activity"],
                                    style: TextStyle(
                                      fontSize: isMobile ? 13 : 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    activity["source"],
                                    style: TextStyle(
                                      fontSize: isMobile ? 11 : 14,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("dd/MMMM/yyyy kk:mm a").format(
                                      DateTime.parse(activity["timeStamp"]),
                                    ),
                                    style: TextStyle(
                                      fontSize: isMobile ? 11 : 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        activity["transaction_type"] == "credit"
                            ? "+${activity["amount"]}"
                            : "-${activity["amount"]}",
                        style: TextStyle(
                          color: activity["transaction_type"] == "credit"
                              ? Colors.green
                              : Colors.red,
                          fontSize: isMobile ? 10 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
