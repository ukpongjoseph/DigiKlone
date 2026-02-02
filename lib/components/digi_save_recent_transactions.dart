import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DigiSaveRecentTransactions extends StatefulWidget {
  const DigiSaveRecentTransactions({super.key});

  @override
  State<DigiSaveRecentTransactions> createState() =>
      _DigiSaveRecentTransactionsState();
}

class _DigiSaveRecentTransactionsState
    extends State<DigiSaveRecentTransactions> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> recentTransactions = [
      {
        'id': 1,
        'type': 'deposit',
        'amount': 5000.00,
        'date': 'Dec 28, 2024',
        'description': 'Monthly Auto-save',
      },
      {
        'id': 2,
        'type': 'deposit',
        'amount': 2500.00,
        'date': 'Dec 15, 2024',
        'description': 'Manual Deposit',
      },
      {
        'id': 3,
        'type': 'deposit',
        'amount': 5000.00,
        'date': 'Nov 28, 2024',
        'description': 'Monthly Auto-save',
      },
      {
        'id': 4,
        'type': 'withdrawal',
        'amount': 10000.00,
        'date': 'Oct 15, 2024',
        'description': 'Cycle Withdrawal',
      },
    ];
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Transactions",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 5),
          Container(
            // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ...recentTransactions.map((item) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(8),
                        minLeadingWidth: 10,
                        minTileHeight: 10,
                        minVerticalPadding: 0,
                        horizontalTitleGap: 10,
                        leading: CircleAvatar(
                          backgroundColor: item["type"] == "deposit"
                              ? Colors.green
                              : Colors.red,
                          child: Icon(
                            item["type"] == "deposit"
                                ? Icons.add
                                : Icons.remove,
                          ),
                        ),
                        title: Text(
                          item["description"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        subtitle: Text(
                          item["date"],
                          style: TextStyle(fontSize: 11),
                        ),
                        trailing: Text(
                          "${item["type"] == "deposit" ? "+" : "-"}₦${item["amount"]}",
                          style: TextStyle(
                            color: item["type"] == "deposit"
                                ? Colors.green
                                : Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        color: recentTransactions.last != item
                            ? Colors.grey
                            : Colors.transparent,
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
