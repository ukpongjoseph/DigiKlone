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
  int activeDateRange = 0;
  String accountType = "savings";
  String statementFormat = "Pdf";
  late String selectedDate;
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
    void fetchdate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2100),
      ).then((onValue) => {selectedDate = onValue.toString()});
    }

    void displayDownloadStatementDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setDialogState) {
              return AlertDialog(
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Downlaod and close
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Download Statement Text
                        Text(
                          "Download Statement",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 15 : 18,
                          ),
                        ),
                        // Cancel icon
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    // Date range
                    Text(
                      "Date range",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                    // Date buttons
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: activeDateRange == 0
                                ? Colors.blue[600]
                                : Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 6,
                            ),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              activeDateRange = 0;
                            });
                          },
                          child: Text(
                            "Last month",
                            style: TextStyle(
                              fontSize: isMobile ? 8 : 10,
                              fontWeight: FontWeight.bold,
                              color: activeDateRange == 0
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: activeDateRange == 1
                                ? Colors.blue[600]
                                : Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 6,
                            ),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              activeDateRange = 1;
                            });
                          },
                          child: Text(
                            "Custom range",
                            style: TextStyle(
                              fontSize: isMobile ? 8 : 10,
                              fontWeight: FontWeight.bold,
                              color: activeDateRange == 1
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Start and End date
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            fetchdate();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start Date",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile ? 10 : 12,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          size: 12,
                                          color: Colors.grey[700],
                                        ),
                                        Text(
                                          "Select date",
                                          style: TextStyle(
                                            fontSize: isMobile ? 10 : 12,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            fetchdate();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End Date",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile ? 10 : 12,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          size: 12,
                                          color: Colors.grey[700],
                                        ),
                                        Text(
                                          "Select date",
                                          style: TextStyle(
                                            fontSize: isMobile ? 10 : 12,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Account Type
                    Text(
                      "Account Type",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 13 : 15,
                      ),
                    ),
                    // Account type Row
                    Row(
                      children: [
                        // All Account button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accountType == "All"
                                ? Colors.blue[600]
                                : Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 10,
                            ),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              accountType = "All";
                            });
                          },
                          child: Text(
                            "All Accounts",
                            style: TextStyle(
                              fontSize: isMobile ? 8 : 10,
                              fontWeight: FontWeight.bold,
                              color: accountType == "All"
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                        // Wallet Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accountType == "wallet"
                                ? Colors.blue[600]
                                : Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 10,
                            ),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              accountType = "wallet";
                            });
                          },
                          child: Text(
                            "Wallet",
                            style: TextStyle(
                              fontSize: isMobile ? 8 : 10,
                              fontWeight: FontWeight.bold,
                              color: accountType == "wallet"
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        // Savings Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accountType == "savings"
                                ? Colors.blue[600]
                                : Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 10,
                            ),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              accountType = "savings";
                            });
                          },
                          child: Text(
                            "Savings",
                            style: TextStyle(
                              fontSize: isMobile ? 8 : 10,
                              fontWeight: FontWeight.bold,
                              color: accountType == "savings"
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Format Level
                    Text(
                      "Format",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 13 : 15,
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: statementFormat == "Pdf"
                                ? Colors.blue[600]
                                : Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 12,
                            ),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              statementFormat = "Pdf";
                            });
                          },
                          child: Text(
                            "PDF",
                            style: TextStyle(
                              fontSize: isMobile ? 8 : 10,
                              fontWeight: FontWeight.bold,
                              color: statementFormat == "Pdf"
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                        SizedBox(width: 3),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: statementFormat == "Excel"
                                ? Colors.blue[600]
                                : Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 12,
                            ),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
                            ),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              statementFormat = "Excel";
                            });
                          },
                          child: Text(
                            "Excel",
                            style: TextStyle(
                              fontSize: isMobile ? 8 : 10,
                              fontWeight: FontWeight.bold,
                              color: statementFormat == "Excel"
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[600],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        onPressed: () {
                          print(selectedDate);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Download statement",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
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
          // Setting indicator to null to prevent interference with custom tab styling
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

  // A custom Tab widget that will allow us to style each tab in the TabBar without using the indicator Property
  Widget customTab(String label, int index) {
    bool isSelected = index == currentIndex;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
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
