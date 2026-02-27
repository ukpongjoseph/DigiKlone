import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/digi_lock_provider.dart';
import 'package:second_flutter/pages/lock_funds.dart';

class PaymentSource extends StatefulWidget {
  const PaymentSource({super.key});

  @override
  State<PaymentSource> createState() => _PaymentSourceState();
}

class _PaymentSourceState extends State<PaymentSource> {
  void showCreatedPlan(){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          title: Text("Fixed Savings Plan Created!"),
          content: Text("Your ${context.read<DigiLockProvider>().getSavingsTitle()} plan has been created successfully."),
          actions: [TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LockFunds()));}, child: Text("OK"))],
        );
      }
    );
  }
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Payment Source",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 16 : 19,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(spacing * 2),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 1.0,
              color: Colors.pink,
              backgroundColor: Colors.grey,
            ),
            Center(
              child: Text(
                "Step 5 of 5",
                style: TextStyle(fontSize: isMobile ? 11 : 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing * 4),
              child: Center(
                child: Text(
                  "Choose how you want to fund this plan",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
              ),
            ),
            Column(
              children: [
                paymentSource(1, Icons.add_card_rounded, "Debit Card", "Pay with linked debit card"),
                paymentSource(2, Icons.wallet, "DigiKolo Wallet", "Use funds from your wallet", "Available: ₦125,00"),
                paymentSource(3, Icons.apartment, "Direct Debit", "Automatic debit from your bank account"),
                paymentSource(4, Icons.compare_arrows_rounded, "Bank Transfer", "Transfer from your bank account"),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedIndex > 0 ? Colors.pink : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          onPressed: () {
            selectedIndex > 0
                ?showCreatedPlan()
                : null;
          },
          child: Text("Create Plan", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget paymentSource(
    int index,
    IconData icon,
    String title,
    String subtitle,
    [String? later]
  ) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      decoration: BoxDecoration(
        color: index==selectedIndex?const Color.fromARGB(255, 193, 237, 194):Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: index==selectedIndex?Colors.green:Colors.grey
        )
      ),
      margin: EdgeInsets.symmetric(vertical: spacing),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: ListTile(
          dense: true,
          isThreeLine: later != null ? true : false,
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.all(spacing),
          minTileHeight: 0,
          minVerticalPadding: 0,
          leading: Icon(icon,color: index==selectedIndex?Colors.green:Colors.grey,),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
          subtitle: Text(
            "$subtitle\n"
            "${later ?? ""}",
            style: TextStyle(fontSize: isMobile ? 11 : 13),
          ),
        ),
      ),
    );
  }
}
