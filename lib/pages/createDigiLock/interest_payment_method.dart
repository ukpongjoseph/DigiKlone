import 'package:flutter/material.dart';

class InterestPaymentMethod extends StatefulWidget {
  const InterestPaymentMethod({super.key});

  @override
  State<InterestPaymentMethod> createState() => _InterestPaymentMethodState();
}

class _InterestPaymentMethodState extends State<InterestPaymentMethod> {
  int selectedIndex = 1;
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
              value: 0.6,
              color: Colors.pink,
              backgroundColor: Colors.grey,
            ),
            Center(
              child: Text(
                "Step 3 of 5",
                style: TextStyle(fontSize: isMobile ? 11 : 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing * 5),
              child: Center(
                child: Text(
                  "When would you like to recieve your interest",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: spacing * 2),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex=1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(spacing*2),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1? Color.fromARGB(255, 216, 246, 217): Colors.transparent,
                        border: Border.all(width: 1.5,
                        color: selectedIndex==1?Colors.green:Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today_outlined, color: selectedIndex==1?Colors.green:Colors.grey,),
                              SizedBox(width: spacing*2,),
                              Text("On Maturity", style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Text("Receive interest at the end of the tenure")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(spacing*2),
                      decoration: BoxDecoration(
                        color: selectedIndex!=1?Color.fromARGB(255, 216, 246, 217):Colors.transparent,
                        border: Border.all(width: 1.5,
                        color: selectedIndex!=1?Colors.green:Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("₦", style: TextStyle(color: selectedIndex!=1?Colors.green:Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: isMobile?18:20),),
                              SizedBox(width: spacing*2,),
                              Text("Upfront", style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Text("Receive interest immediately")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
