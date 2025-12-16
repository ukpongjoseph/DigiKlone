import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/transaction_activity.dart';

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
    double spacing = isMobile ? 5 : 8;
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
          _deposits(),
          _withdrawals(),
          _savings(),
          _referrals(),
        ],
      ),
    );
  }

  Widget _allActivities() {
    final List<Map<String, dynamic>> _allTransactionActivities = context
        .read<TransactionActivity>()
        .fetchTransactionActivities();
    // now we need to group data by date, thought they are already sorted. We will be creating a map. This map will hold a key which is the date and the value which is the List of maps(map of string to dynamic)
    // what we plan on doing is take each date, make it a key...then make a list containing maps of that date, thus forming our key - value pair.
    Map<String, List<Map<String, dynamic>>> sortedTransactionActivities = {};
    for (var activity in _allTransactionActivities) {
      // Create a date which is the key
      String date = activity["date"];
      // checking the new Map if it has the key(from the date above). if not create a List for that key for it to be able to hold new elements....else if the key exist, we will just add the new element to the list that the key holds
      if (!sortedTransactionActivities.containsKey(date)) {
        sortedTransactionActivities[date] = [];
      }
      sortedTransactionActivities[date]!.add(activity);
    }
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ...sortedTransactionActivities.entries.map((activity) {
            List<Map<String, dynamic>> transactions = activity.value;
            return Column(
              children: [
                Text(activity.key, style: TextStyle(fontSize: 35)),
                ...transactions.map((transaction) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: Column(children: [Text(transaction["type"])]),
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _deposits() {
    final List<Map<String, dynamic>> allTransactionActivities = context
        .read<TransactionActivity>()
        .fetchTransactionActivities();
    final List<Map<String, dynamic>> _deposits = allTransactionActivities
        .where((e) => e["type"] == "deposit")
        .toList();
    return Container(margin: EdgeInsets.all(8), child: Text("Deposits"));
  }

  Widget _withdrawals() {
    final List<Map<String, dynamic>> allTransactionActivities = context
        .read<TransactionActivity>()
        .fetchTransactionActivities();
    final List<Map<String, dynamic>> _withdrawals = allTransactionActivities
        .where((e) => e["type"] == "withdrawal")
        .toList();
    return Container(margin: EdgeInsets.all(8), child: Text("Withdrawals"));
  }

  Widget _savings() {
    final List<Map<String, dynamic>> allTransactionActivities = context
        .read<TransactionActivity>()
        .fetchTransactionActivities();
    final List<Map<String, dynamic>> _savings = allTransactionActivities
        .where((e) => e["type"] == "savings")
        .toList();
    return Container(margin: EdgeInsets.all(8), child: Text("Savings"));
  }

  Widget _referrals() {
    final List<Map<String, dynamic>> allTransactionActivities = context
        .read<TransactionActivity>()
        .fetchTransactionActivities();
    final List<Map<String, dynamic>> _referrals = allTransactionActivities
        .where((e) => e["type"] == "referral")
        .toList();
    return Container(margin: EdgeInsets.all(8), child: Text("Referrals"));
  }
}
