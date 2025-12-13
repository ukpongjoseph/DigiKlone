import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletBalanceCard extends StatefulWidget {
  const WalletBalanceCard({super.key});

  @override
  State<WalletBalanceCard> createState() => _WalletBalanceCardState();
}

class _WalletBalanceCardState extends State<WalletBalanceCard> {
  bool balanceVisible = true;
  @override
  Widget build(BuildContext context) {
    void depositDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Deposit Money"),
            content: Text("Choose your deposit method;"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Bank Transfer"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Card Payment"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
            ],
          );
        },
      );
    }

    void withdrawDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Withdraw Money'),
            content: Text('Choose withdrawal method;'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('To Bank Account'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    String balance = "₦47,350.00";
    String hiddenBalance = "₦********";
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 33, 44, 193),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: spacing * 5),
              Text(
                "Wallet Balance",
                style: TextStyle(
                  color: const Color.fromARGB(255, 221, 227, 234),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    balanceVisible = !balanceVisible;
                  });
                },
                icon: balanceVisible
                    ? Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                        size: isMobile ? 18 : 28,
                      )
                    : Icon(Icons.visibility_off_outlined, color: Colors.white),
              ),
            ],
          ),
          balanceVisible
              ? Text(
                  balance,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 32 : 42,
                  ),
                )
              : Text(hiddenBalance, style: TextStyle(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  depositDialog();
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  backgroundColor: const Color.fromARGB(255, 23, 137, 195),
                ),
                label: Text(
                  "Deposit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 23,
                  ),
                ),
                icon: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(width: spacing * 2.5),
              TextButton.icon(
                onPressed: () {
                  withdrawDialog();
                },
                label: Text(
                  "Withdraw",
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 23,
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  backgroundColor: Colors.white,
                ),
                icon: Icon(Icons.remove, color: Colors.blue[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
