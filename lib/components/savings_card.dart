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
    void showDigiTribeDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              child: Column(
                // making the dialog box responsive
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Coming Soon!"),
                          Icon(Icons.rocket_launch_sharp),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close, size: isMobile ? 20 : 30),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.purple[100],
                    child: Icon(Icons.people_alt_outlined),
                  ),
                  Text(
                    "DigiTribe is coming soon! Save together with friends and family in group challenges with exciting rewards",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: isMobile ? 10 : 13),
                  ),
                  Text(
                    "Expected launch: Q2 2025",
                    style: TextStyle(
                      color: Colors.purple[500],
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile ? 11 : 14,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          139,
                          64,
                          251,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Got it!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

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
            return GestureDetector(
              onTap: () {
                plan["page_exists"]
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => plan["page"]),
                      )
                    : showDigiTribeDialog();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    padding: isMobile ? EdgeInsets.all(10) : EdgeInsets.all(12),
                    margin: isMobile
                        ? EdgeInsets.fromLTRB(0, 0, 0, 10)
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
                              child: Icon(
                                plan["icon"],
                                size: isMobile ? 25 : 35,
                              ),
                            ),
                            Container(
                              padding: isMobile
                                  ? EdgeInsets.symmetric(
                                      vertical: 3.0,
                                      horizontal: 6.0,
                                    )
                                  : EdgeInsets.symmetric(
                                      vertical: 6.0,
                                      horizontal: 10.0,
                                    ),
                              decoration: BoxDecoration(
                                color: plan["container-color"],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                plan["rate"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isMobile ? 10 : 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: spacing * 2.5),
                        Text(
                          plan["type"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 16 : 20,
                          ),
                        ),
                        SizedBox(height: spacing * 1.5),
                        Text(
                          plan["description"],
                          style: TextStyle(fontSize: isMobile ? 12 : 15),
                        ),
                        SizedBox(height: spacing * 2.5),
                        Text(
                          plan["field"],
                          style: TextStyle(fontSize: isMobile ? 11 : 14),
                        ),
                        SizedBox(height: spacing - 1),
                        Text(
                          plan["balance"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 15 : 19,
                          ),
                        ),
                      ],
                    ),
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
