import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/transaction_activity.dart';
import 'package:second_flutter/components/deposit_activity.dart';
import 'package:second_flutter/components/referral_activity.dart';
import 'package:second_flutter/components/savings_activity.dart';
import 'package:second_flutter/components/withdrawal_activity.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  static List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("All"),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("Deposits"),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("Withdrawals"),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("Savings"),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("Referrals"),
      ),
    ),
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    // double spacing = isMobile ? 5 : 8;
    void displayDownloadStatementDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Downlaod Statement"),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Activity",
          style: TextStyle(
            fontSize: isMobile ? 30 : 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: displayDownloadStatementDialog,
            child: CircleAvatar(child: Icon(Icons.file_download_outlined)),
          ),
          SizedBox(width: 3.0),
          CircleAvatar(child: Icon(Icons.filter_alt)),
        ],
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          indicator: BoxDecoration(
            // color: Colors.blueGrey
          ),
          padding: EdgeInsets.zero,
          isScrollable: true,
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _allActivities(),
          DepositActivity(),
          WithdrawalActivity(),
          SavingsActivity(),
          ReferralActivity(),
        ],
      ),
    );
  }

  Widget _allActivities() {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    final List<Map<String, dynamic>> allTransactionActivities = context
        .read<TransactionActivity>()
        .fetchTransactionActivities();
    // now we need to group data by date, thought they are already sorted. We will be creating a map. This map will hold a key which is the date and the value which is the List of maps(map of string to dynamic)
    // what we plan on doing is take each date, make it a key...then make a list containing maps of that date, thus forming our key - value pair.
    Map<String, List<Map<String, dynamic>>> sortedTransactionActivities = {};
    for (var activity in allTransactionActivities) {
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
                              SizedBox(height: spacing * 3),
                              Text(
                                activity.key,
                                style: TextStyle(
                                  fontSize: isMobile ? 15 : 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: spacing),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: isMobile
                                    ? EdgeInsets.all(5)
                                    : EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    ...transactions.map((transaction) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            transaction["avatar_color"],
                                                        child: Icon(
                                                          transaction["icon"],
                                                          color:
                                                              transaction["color"],
                                                          size: isMobile
                                                              ? 20
                                                              : 14,
                                                        ),
                                                      ),
                                                      SizedBox(width: spacing),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            transaction["title"],
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: isMobile
                                                                  ? 12.5
                                                                  : 14.5,
                                                            ),
                                                          ),
                                                          Text(
                                                            transaction["subtitle"],
                                                            style: TextStyle(
                                                              fontSize: isMobile
                                                                  ? 11
                                                                  : 13,
                                                            ),
                                                          ),
                                                          Text(
                                                            transaction["time"],
                                                            style: TextStyle(
                                                              fontSize: isMobile
                                                                  ? 11
                                                                  : 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    transaction["type"] ==
                                                            "withdrawal"
                                                        ? "-${transaction["amount"]}"
                                                        : "+${transaction["amount"]}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: isMobile
                                                          ? 13
                                                          : 15,
                                                      color:
                                                          transaction["type"] ==
                                                              "withdrawal"
                                                          ? Colors.red
                                                          : Colors.green,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .fiber_manual_record,
                                                        color:
                                                            transaction["color"],
                                                        size: isMobile
                                                            ? 10
                                                            : 12,
                                                      ),
                                                      Text(
                                                        transaction["status"],
                                                        style: TextStyle(
                                                          fontSize: isMobile
                                                              ? 10
                                                              : 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: spacing * 2),
                                          Divider(),
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
