import 'package:flutter/material.dart';
import 'package:second_flutter/components/wallet_balance_card.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Text(
          "Wallet",
          style: TextStyle(
            fontSize: isMobile ? 30 : 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 194, 202, 227),
          child: Container(
            margin: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [WalletBalanceCard(), Text('Virtual Account')],
            ),
          ),
        ),
      ),
    );
  }
}
