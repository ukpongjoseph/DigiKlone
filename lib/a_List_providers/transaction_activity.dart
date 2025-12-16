import 'package:flutter/material.dart';

class TransactionActivity extends ChangeNotifier {
  final List<Map<String, dynamic>> _transactionsActivities = [
  {
    "id": 1,
    "type": "deposit",
    "title": "Bank Transfer",
    "subtitle": "Deposit to wallet",
    "amount": "₦15,000.00",
    "date": "Today",
    "time": "2:30 PM",
    "status": "completed",
    "icon": Icons.south_west_outlined,
    "color": Colors.green,
    "avatar_color" : const Color.fromARGB(255, 203, 245, 204),
  },
  {
    "id": 2,
    "type": "savings",
    "title": "DigiSave Deposit",
    "subtitle": "Regular savings",
    "amount": "₦5,000.00",
    "date": "Today",
    "time": "1:15 PM",
    "status": "completed",
    "icon": Icons.savings,
    "color": Colors.blue,
    "avatar_color" : const Color.fromARGB(255, 206, 228, 247)
  },
  {
    "id": 3,
    "type": "referral",
    "title": "Referral Bonus",
    "subtitle": "From John Doe",
    "amount": "₦200.00",
    "date": "Yesterday",
    "time": "4:20 PM",
    "status": "completed",
    "icon": Icons.group,
    "color": Colors.orange,
    "avatar_color" : const Color.fromARGB(255, 247, 228, 200)
  },
  {
    "id": 4,
    "type": "withdrawal",
    "title": "Bank Withdrawal",
    "subtitle": "To GTBank ••••0123",
    "amount": "₦10,000.00",
    "date": "Yesterday",
    "time": "10:15 AM",
    "status": "completed",
    "icon": Icons.north_east_outlined,
    "color": Colors.red,
    "avatar_color" : const Color.fromARGB(255, 253, 217, 214)
  },
  {
    "id": 5,
    "type": "savings",
    "title": "DigiTarget Deposit",
    "subtitle": "Goal: New Laptop",
    "amount": "₦8,000.00",
    "date": "Aug 7",
    "time": "3:45 PM",
    "status": "completed",
    "icon": Icons.savings,
    "color" : Colors.blue,
    "avatar_color" : const Color.fromARGB(255, 206, 228, 247)
  },
  {
      "id": 6,
      "type": "deposit",
      "title": "Card Payment",
      "subtitle": "Visa ••••4859",
      "amount": "₦25,000.00",
      "date": "Aug 7",
      "time": "2:10 PM",
      "status": "completed",
      "icon": Icons.south_west_outlined,
      "color": Colors.green,
      "avatar_color" : const Color.fromARGB(255, 203, 245, 204),
    },
    {
      "id": 7,
      "type": "savings",
      "title": "DigiLock Investment",
      "subtitle": "12% interest rate",
      "amount": "₦100,000.00",
      "date": "Aug 6",
      "time": "11:30 AM",
      "status": "completed",
      "icon": Icons.savings,
      "color": Colors.blue,
      "avatar_color" : const Color.fromARGB(255, 206, 228, 247)
    },
];

List<Map<String, dynamic>> fetchTransactionActivities(){
  // Dates are already sorted, so no need for any extra sorting of the data
  
  return _transactionsActivities;
}

}