import 'package:flutter/material.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  final List<Map<String, dynamic>> recentTransactions = [
    {
      "type": "deposit",
      "description": "Bank Transfer",
      "amount": "₦15,000.00",
      "date": "Today, 2:30 PM",
      "status": "completed",
    },
    {
      "type": "withdrawal",
      "description": "To GTBank",
      "amount": "₦5,000.00",
      "date": "Yesterday, 10:15 AM",
      "status": "completed",
    },
    {
      "type": "deposit",
      "description": "Card Payment",
      "amount": "₦25,000.00",
      "date": "Aug 7, 4:20 PM",
      "status": "completed",
    },
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      padding: isMobile
          ? EdgeInsets.symmetric(vertical: 8)
          : EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Transactions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 15 : 19,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          ...recentTransactions.map((transaction) {
            return Container(
              margin: isMobile
                  ? EdgeInsets.symmetric(vertical: 4.0)
                  : EdgeInsets.symmetric(vertical: 6.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: isMobile ? 18 : 20,
                        backgroundColor: transaction["type"] == "deposit"
                            ? const Color.fromARGB(255, 160, 228, 162)
                            : const Color.fromARGB(255, 241, 165, 159),
                        child: transaction["type"] == "deposit"
                            ? Icon(
                                Icons.south_west_outlined,
                                color: const Color.fromARGB(255, 16, 149, 21),
                                size: isMobile ? 15 : 17,
                              )
                            : Icon(
                                Icons.arrow_outward,
                                color: Colors.red,
                                size: isMobile ? 15 : 17,
                              ),
                      ),
                      SizedBox(width: spacing * 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction["description"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 12.5 : 15,
                            ),
                          ),
                          Text(
                            transaction["date"],
                            style: TextStyle(fontSize: isMobile ? 10 : 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    transaction["type"] == "deposit"
                        ? "+${transaction["amount"]}"
                        : "-${transaction["amount"]}",
                    style: TextStyle(
                      color: transaction["type"] == "deposit"
                          ? Colors.green
                          : Colors.red,
                      fontSize: isMobile ? 12 : 14,
                      fontWeight: FontWeight.bold,
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
