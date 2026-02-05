import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class TransferMoney3 extends StatefulWidget {
  const TransferMoney3({super.key});

  @override
  State<TransferMoney3> createState() => _TransferMoney3State();
}

class _TransferMoney3State extends State<TransferMoney3> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
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
        alignment: Alignment.center,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            customPageTracker(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Prev"),
              ),
            ),
          ],
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
