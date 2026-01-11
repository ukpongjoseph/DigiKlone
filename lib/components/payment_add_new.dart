import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentAddNew extends StatefulWidget {
  const PaymentAddNew({super.key});

  @override
  State<PaymentAddNew> createState() => _PaymentAddNewState();
}

class _PaymentAddNewState extends State<PaymentAddNew> {
  void displayWidgetDialog(
    String dialogTitle,
    String dialogContent,
    String dialogPopButtonText,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(dialogTitle),
          content: Text(dialogContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(dialogPopButtonText),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add New Method",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 15 : 17,
          ),
        ),
        SizedBox(height: spacing * 2),
        methodWidget(
          Icons.wallet,
          "Add Debit/Credit Card",
          "Add a card for easy payments",
          "Add Card",
          "Add a new debit or credit card",
          "Add Card",
        ),
        methodWidget(
          Icons.apartment,
          "Add Bank Account",
          "Link your bank for direct transfers",
          "Add Bank Account",
          "Link your bank for direct transfers",
          "Add Account",
        ),
      ],
    );
  }

  Widget methodWidget(
    IconData leadingIcon,
    String leading,
    String subtitle,
    String dialogTitle,
    String dialogContent,
    String dialogPopButtonText,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return GestureDetector(
      onTap: () {
        displayWidgetDialog(dialogTitle, dialogContent, dialogPopButtonText);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Colors.grey),
        ),
        child: ListTile(
          dense: true,
          minVerticalPadding: 3,
          contentPadding: EdgeInsets.all(0),
          horizontalTitleGap: 6,
          minTileHeight: 10,
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Icon(leadingIcon, color: Colors.blue[900]),
          ),
          title: Text(
            leading,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: isMobile ? 11 : 13),
          ),
          trailing: Icon(Icons.add),
        ),
      ),
    );
  }
}
