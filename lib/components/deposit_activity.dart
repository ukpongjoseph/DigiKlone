import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/transaction_activity.dart';

class DepositActivity extends StatefulWidget {
  const DepositActivity({super.key});

  @override
  State<DepositActivity> createState() => _DepositActivityState();
}

class _DepositActivityState extends State<DepositActivity> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    final List<Map<String, dynamic>> allTransactionActivities = context
        .read<TransactionActivity>()
        .fetchTransactionActivities();
    final List<Map<String, dynamic>> deposits = allTransactionActivities
        .where((e) => e["type"] == "deposit")
        .toList();
    // now we need to group data by date, thought they are already sorted. We will be creating a map. This map will hold a key which is the date and the value which is the List of maps(map of string to dynamic)
    // what we plan on doing is take each date, make it a key...then make a list containing maps of that date, thus forming our key - value pair.
    Map<String, List<Map<String, dynamic>>> sortedTransactionActivities = {};
    for (var activity in deposits) {
      // Create a date which is the key
      String date = activity["date"];
      // checking the new Map if it has the key(from the date above). if not create a List for that key for it to be able to hold new elements....else if the key exist, we will just add the new element to the list that the key holds
      if (!sortedTransactionActivities.containsKey(date)) {
        sortedTransactionActivities[date] = [];
      }
      sortedTransactionActivities[date]!.add(activity);
    }
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            sortedTransactionActivities.isEmpty
                ? Container(
                    margin: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey[700],
                          size: isMobile ? 60 : 80,
                        ),
                        SizedBox(height: spacing),
                        Text(
                          "No transactions found",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 20 : 30,
                          ),
                        ),
                        SizedBox(height: spacing),
                        Text(
                          "Try adjusting your search or filter",
                          style: TextStyle(fontSize: isMobile ? 14 : 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    child: Column(
                      children: [
                        ...sortedTransactionActivities.entries.map((activity) {
                          List<Map<String, dynamic>> transactions =
                              activity.value;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activity.key,
                                style: TextStyle(fontSize: 35),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    ...transactions.map((transaction) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            leading: Icon(transaction["icon"]),
                                            title: Text(transaction["title"]),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(transaction["subtitle"]),
                                                Text(transaction["time"]),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
