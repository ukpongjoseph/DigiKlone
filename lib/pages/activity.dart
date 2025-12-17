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
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
          // This property removes any styling effect when i hover on any tab in the tab Bar
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          labelPadding: EdgeInsets.symmetric(horizontal: 3),
          tabAlignment: TabAlignment.start,
          indicator: BoxDecoration(),
          padding: EdgeInsets.zero,
          isScrollable: true,
          labelColor: Colors.white,
          controller: _tabController,
          tabs: [
            customTab("All", 0),
            customTab("Deposits", 1),
            customTab("Withdrawal", 2),
            customTab("savings", 3),
            customTab("Referrals", 4),
          ],
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
    Map<String, List<Map<String, dynamic>>> sortedTransactionActivities = {};
    for (var activity in allTransactionActivities) {
      String date = activity["date"];
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
                                    ...transactions.asMap().entries.map((
                                      entry,
                                    ) {
                                      int index = entry.key;
                                      var transaction = entry.value;
                                      bool isLast =
                                          index == transactions.length - 1;

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
                                          if (!isLast) ...[
                                            SizedBox(height: spacing * 2),
                                            Divider(),
                                          ],
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

  Widget customTab(String label, int Index) {
    bool isSelected = Index == currentIndex;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[900] : Colors.transparent,
        border: Border.all(
          width: 1.5,
          color: isSelected ? Colors.transparent : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label),
    );
  }
}
