// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/beneficiaries_provider.dart';
import 'package:second_flutter/pages/digi_target_savings.dart';
import 'package:second_flutter/pages/transfer_money.dart';

class QuickTransfer extends StatefulWidget {
  const QuickTransfer({super.key});

  @override
  State<QuickTransfer> createState() => _QuickTransferState();
}

class _QuickTransferState extends State<QuickTransfer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    final List<Map<String, dynamic>> beneficiaries = context
        .read<BeneficiariesProvider>()
        .fetchBeneficiaries();
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5.0 : 8.0;
    void showQuickTransferInfo() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              "Quick Transfer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Padding(
              padding: EdgeInsetsGeometry.all(5.0),
              child: Text(
                "Send money to the wallet of other DigiKolo Users via their Wallet account number",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 11 : 14),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: isMobile
          ? EdgeInsetsGeometry.all(10.0)
          : EdgeInsetsGeometry.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Quick Transfer",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showQuickTransferInfo();
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1.0),
                      ),
                      child: Text("i"),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferMoney()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 183, 242),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: isMobile
                      ? EdgeInsets.fromLTRB(6.0, 3, 6.0, 3)
                      : EdgeInsets.fromLTRB(9.0, 3, 9.0, 3),
                  child: Row(
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                      SizedBox(width: spacing - 3),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.purple,
                        size: isMobile ? 25 : 35,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: spacing + 3),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DigiTargetSavings()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 6, 115, 183),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: isMobile ? EdgeInsets.all(15.0) : EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(
                              255,
                              63,
                              138,
                              184,
                            ),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                          SizedBox(width: spacing * 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Send to New Contact",
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Transfer money to anyone",
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_right_alt, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          beneficiaries.isEmpty 
          ? 
          Container(
            color: Colors.white54,
            child: Column(
              children: [
                Icon(Icons.people_alt_outlined),
                SizedBox(height: spacing,),
                Text("No Recent Transers"),
                SizedBox(height: spacing,),
                Text("Start by sending money to someone"),
                SizedBox(height: spacing + 3,),
                Row(
                  children: [
                    Text("Send Money"),
                    SizedBox(width: spacing-2,),
                    Icon(Icons.arrow_forward)
                  ],
                )
              ],
            ),
          ) 
          : 
          Container(
            color: Colors.white60,
            child: Column(
              children: [
                Text("Recent Contacts"),
                SizedBox(height: spacing + 2,),
                ...beneficiaries.map((items){
                  return Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_2_outlined)
                              ],
                            ),
                            SizedBox(width: spacing,),
                            Column(
                              children: [
                                Text(items["names"]),
                                Text(items["number"])
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.swap_vert_circle_outlined)
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
