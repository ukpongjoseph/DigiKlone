import 'package:flutter/material.dart';
import 'package:second_flutter/components/page_2_transfer_money_page_2.dart';
// import 'package:provider/provider.dart';
// import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/transferMoney/transfer_money_3.dart';

class TransferMoney2 extends StatefulWidget {
  const TransferMoney2({super.key});

  @override
  State<TransferMoney2> createState() => _TransferMoney2State();
}

class _TransferMoney2State extends State<TransferMoney2> {
  // variable to recieve boolean from child
  bool canContinue = true;

  // defined function that will be passed to child, called in child so as to recieveb boolean value from child
  void recieveBool(bool fromChild) {
    setState(() {
      canContinue = fromChild;
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
        padding: EdgeInsets.symmetric(horizontal: spacing * 2),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: customPageTracker()),
            Page2TransferMoneyPage2(boolToBePassed: recieveBool),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: TextButton(
          onPressed: () {
            canContinue
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferMoney3()),
                  )
                : null;
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: canContinue ? Colors.blue : Colors.grey,
          ),
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: Colors.blueAccent,
                        ),
                      ),
                      child: Text("2", style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.5, color: Colors.grey),
                      ),
                      child: Text("3"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: spacing * 4),
            Text(
              "Enter Amount",
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
