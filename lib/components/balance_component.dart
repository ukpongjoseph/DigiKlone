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
  dynamic savings = 220500.00;
  dynamic wallet = 47350.00;
  
  @override
  void initState(){
    super.initState();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
  }

  late final DateTime now;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            color: Colors.blue[700],
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              walletDefault = true;
                            });
                          },
                          child: Text(
                            "Total savings",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              walletDefault = false;
                            });
                          },
                          child: Text(
                            "DigiWallet",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.topLeft,
                      child: walletDefault
                          ? Text("Total Savings")
                          : Text("Wallet balance"),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        walletDefault ? Text("₦$savings", style: TextStyle(fontWeight: FontWeight.bold),) : Text("₦$wallet"),
                        SizedBox(width: 20.0),
                        digitVisibility
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    digitVisibility = false;
                                    wallet = "********";
                                    savings = "********";
                                    now = DateTime.now();
                                    print(now);
                                  });
                                },
                                icon: Icon(Icons.visibility_outlined),
                                color: Colors.white,
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    digitVisibility = true;
                                    savings = 220500.00;
                                    wallet = 47350.00;
                                  });
                                },
                                icon: Icon(Icons.visibility_off_outlined),
                                color: Colors.white,
                              ),
                      ],
                    ),
                    SizedBox(height: 20.0),
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

                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_outlined,
                                  color: Colors.white,
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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_outlined,
                                  color: Colors.white,
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
