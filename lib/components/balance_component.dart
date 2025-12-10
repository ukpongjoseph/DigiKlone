import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';

class BalanceComponent extends StatefulWidget {
  const BalanceComponent({super.key});

  @override
  State<BalanceComponent> createState() => _BalanceComponentState();
}

class _BalanceComponentState extends State<BalanceComponent> {
  bool walletDefault = true;
  bool digitVisibility = true;
  dynamic savings = "220,500.00";
  dynamic wallet = "47,350.00";
  late final DateTime now;
  int activeButton = 1;

  @override
  Widget build(BuildContext context) {
    double scrennWidth = MediaQuery.of(context).size.width;
    bool isMobile = scrennWidth < 600;
    double spacing = isMobile ? 7.0 : 9.0;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            color: Colors.blue[700],
            child: Padding(
              padding: isMobile ? EdgeInsetsGeometry.all(12.0) : EdgeInsetsGeometry.all(17.0),
              child: DefaultTextStyle(
                style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(9.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  walletDefault = true;
                                  activeButton = 1;
                                });
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0)
                                ),
                                backgroundColor: activeButton == 1 ? Colors.blue[200] : Colors.blue[400]
                              ),
                              child: Text(
                                "Total savings",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  walletDefault = false;
                                  activeButton = 2;
                                });
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0)
                                ),
                                backgroundColor: activeButton == 2 ? Colors.blue[200] : Colors.blue[400]
                              ),
                              child: Text(
                                "DigiWallet",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing * 2.5,),
                    Container(
                      alignment: Alignment.topLeft,
                      child: walletDefault
                          ? Text(
                            "Total Savings",
                            style: TextStyle(
                              fontSize: isMobile ? 13 : 17
                            ),
                          )
                          : Text(
                            "Wallet balance",
                            style: TextStyle(
                              fontSize: isMobile ? 13 : 17
                            ),
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        walletDefault ? Text(
                          "₦$savings", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: scrennWidth * 0.095
                          ),
                        ) : Text(
                          "₦$wallet",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: scrennWidth * 0.095
                          ),
                        ),
                        SizedBox(width: 20.0),
                        digitVisibility
                            ? CircleAvatar(
                              backgroundColor: Colors.blue[300],
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      digitVisibility = false;
                                      wallet = "********";
                                      savings = "********";
                                    });
                                  },
                                  icon: Icon(Icons.visibility_outlined),
                                  color: Colors.white,
                                ),
                            )
                            : CircleAvatar(
                              backgroundColor: Colors.blue[300],
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      digitVisibility = true;
                                      savings = "220,500.00";
                                      wallet = "47,350.00";
                                    });
                                  },
                                  icon: Icon(Icons.visibility_off_outlined),
                                  color: Colors.white,
                                ),
                            ),
                      ],
                    ),
                    Container(
                      child: walletDefault
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    context.read<NavProvider>().setCurrentPage(
                                      1,
                                    );
                                  },
                                  child: Text(
                                    "View All Savings",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isMobile ? 12 : 14
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_outlined,
                                  color: Colors.white,
                                  size: isMobile ? 15 : 25,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    context.read<NavProvider>().setCurrentPage(
                                      2,
                                    );
                                  },
                                  child: Text(
                                    "Go To Wallet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isMobile ? 12 : 14
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_outlined,
                                  color: Colors.white,
                                  size: isMobile ? 15 : 25,
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
