import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/savings_plan.dart';

class SavingsCard extends StatefulWidget {
  const SavingsCard({super.key});

  @override
  State<SavingsCard> createState() => _SavingsCardState();
}

class _SavingsCardState extends State<SavingsCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 9;
    List<Map<String, dynamic>> savingsPlans = context
        .read<DigiSavingsPlans>()
        .fetchPlans();
    return Container(
      margin: isMobile
          ? EdgeInsets.symmetric(vertical: 10, horizontal: 8)
          : EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        children: [
          ...savingsPlans.map((plan) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.4,
                  padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(12),
                  margin: isMobile
                      ? EdgeInsets.fromLTRB(0, 0, 0, 8)
                      : EdgeInsets.fromLTRB(0, 0, 0, 15),
                  decoration: BoxDecoration(
                    color: plan["color"],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: plan["avatar_color"],
                            child: plan["icon"],
                          ),
                          Container(
                            padding: isMobile
                                ? EdgeInsets.all(3)
                                : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: plan["container-color"],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(plan["rate"]),
                          ),
                        ],
                      ),
                      SizedBox(height: spacing),
                      Text(plan["type"]),
                      SizedBox(height: spacing),
                      Text(plan["description"]),
                      SizedBox(height: spacing),
                      Text(plan["field"]),
                      SizedBox(height: spacing),
                      Text(plan["balance"]),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
