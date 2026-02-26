import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/digi_lock_provider.dart';
import 'package:second_flutter/pages/createDigiLock/payment_source.dart';

class Page4CreateLockPage extends StatefulWidget {
  const Page4CreateLockPage({super.key});

  @override
  State<Page4CreateLockPage> createState() => _Page4CreateLockPageState();
}

class _Page4CreateLockPageState extends State<Page4CreateLockPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Interest Payment",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 16 : 19,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(spacing * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 0.8,
              color: Colors.pink,
              backgroundColor: Colors.grey,
            ),
            Center(
              child: Text(
                "Step 4 of 5",
                style: TextStyle(fontSize: isMobile ? 11 : 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing * 5),
              child: Center(
                child: Text(
                  "Review your fixed savings plan details",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(spacing * 3),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    context.read<DigiLockProvider>().getSavingsTitle(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 17 : 20,
                    ),
                  ),
                  Text(
                    "₦${context.read<DigiLockProvider>().getAmount()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 22 : 25,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${context.read<DigiLockProvider>().getDays()} days",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: spacing),
                        child: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.white,
                          size: spacing,
                        ),
                      ),
                      Text(
                        "${context.read<DigiLockProvider>().getSavingsInterest()}% p.a.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing * 3),
              child: Container(
                padding: EdgeInsets.all(spacing * 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Principal Amount",
                          style: TextStyle(fontSize: isMobile ? 11 : 13),
                        ),
                        Text(
                          "₦${context.read<DigiLockProvider>().getAmount()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 13 : 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Interest Earned",
                          style: TextStyle(fontSize: isMobile ? 11 : 13),
                        ),
                        Text(
                          "₦7.025",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isMobile ? 13 : 15,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Interest Payment",
                          style: TextStyle(fontSize: isMobile ? 11 : 13),
                        ),
                        Text(
                          context.read<DigiLockProvider>().getInterestPayment(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isMobile ? 13 : 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Maturity Date",
                          style: TextStyle(fontSize: isMobile ? 11 : 13),
                        ),
                        Text(
                          "6 Oct 2026",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isMobile ? 13 : 15,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total at Maturity",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 13 : 15,
                          ),
                        ),
                        Text("₦${context.read<DigiLockProvider>().getAmount() + 7.025}",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 13 : 15,
                          ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(spacing),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Colors.orange
                ),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 254, 244, 154), 
              ),
              child: ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                minTileHeight: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                leading: Checkbox(
                  value: isChecked, 
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked=value!;
                    });
                  },
                ),
                title: Expanded(child: Text("I hereby agree for a DigiLock of ${context.read<DigiLockProvider>().getAmount()} to be placed on my funds and returned to my DigiWallet with interest on 6 Oct 2026. I also agree that my DigiLock cannot be broken until maturity", style: TextStyle(fontSize: isMobile?10:12, color: Colors.orange.shade900),)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isChecked?Colors.pink:Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          onPressed: () {
            isChecked?Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSource())):null;
          },
          child: Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
