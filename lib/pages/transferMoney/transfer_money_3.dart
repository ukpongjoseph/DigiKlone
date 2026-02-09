import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/money_transfer_provider.dart';
import 'package:second_flutter/pages/landing_page.dart';
// import 'package:provider/provider.dart';
// import 'package:second_flutter/a_List_providers/theme_provider.dart';

class TransferMoney3 extends StatefulWidget {
  const TransferMoney3({super.key});

  @override
  State<TransferMoney3> createState() => _TransferMoney3State();
}

class _TransferMoney3State extends State<TransferMoney3> {

  void displaySuccessfulTransfer(){
    showDialog(context: context, builder: (BuildContext context){
      return CupertinoAlertDialog(
        title: Text("Transfer Successful"),
        content: Text("Your Transfer of ₦${context.read<MoneyTransferProvider>().getTransferAmount()} to ${context.read<MoneyTransferProvider>().getBeneficiaryName()} is successful"),
        actions: [TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LandingPage()));}, child: Text("Go back Home"))],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Transfer Money",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 18 : 21,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: spacing * 3),
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Center(child: customPageTracker()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: spacing*3),
              padding: EdgeInsets.all(spacing*2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.5,
                  color: Colors.grey
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: spacing*1.5),
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 219, 235, 242),
                      child: Icon(Icons.wallet, color: Colors.blue,),
                    ),
                  ),
                  Text("₦${context.read<MoneyTransferProvider>().getTransferAmount()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile?26:30),),
                  SizedBox(height: spacing,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("To", style: TextStyle(color: Colors.grey.shade700, fontSize: isMobile?12:14),),
                      Text(context.read<MoneyTransferProvider>().getBeneficiaryName(), style: TextStyle(fontSize: isMobile?13:15, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Account", style: TextStyle(color: Colors.grey.shade700, fontSize: isMobile?12:14),),
                      Text(context.read<MoneyTransferProvider>().getBeneficiaryAccountNumber(), style: TextStyle(fontSize: isMobile?13:15, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fee", style: TextStyle(color: Colors.grey.shade700, fontSize: isMobile?12:14),),
                      Text("₦0.00", style: TextStyle(fontSize: isMobile?13:15, fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(spacing*2),
        child: TextButton(
          style: TextButton.styleFrom(
            
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: (){
            displaySuccessfulTransfer();
          }, 
          child: Text("Complete Transfer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        )
      ),
    );
  }

  Widget customPageTracker() {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: screenWidth * 0.6,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: Colors.blueAccent,
                        ),
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: Colors.blueAccent,
                        ),
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: Colors.blueAccent,
                        ),
                      ),
                      child: Text("3", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: spacing * 4),
            Text(
              "Confirm Transfer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 20 : 23.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
