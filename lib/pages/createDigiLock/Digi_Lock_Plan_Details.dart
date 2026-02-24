import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/digi_lock_provider.dart';
import 'package:second_flutter/pages/createDigiLock/interest_payment_method.dart';

class DigiLockPlanDetails extends StatefulWidget {
  const DigiLockPlanDetails({super.key});

  @override
  State<DigiLockPlanDetails> createState() => _DigiLockPlanDetailsState();
}

class _DigiLockPlanDetailsState extends State<DigiLockPlanDetails> {
  bool canSubmit = false;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      setState(() {
        canSubmit =
            titleController.text.length > 1 &&
            int.parse(amountController.text) > 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Plan Details",
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
              value: 0.4,
              color: Colors.pink,
              backgroundColor: Colors.grey,
            ),
            Center(
              child: Text(
                "Step 2 of 5",
                style: TextStyle(fontSize: isMobile ? 11 : 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing * 5),
              child: Text(
                "Name your savings plan and set the amount to lock",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 12 : 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing * 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Savings Title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 13 : 15,
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    style: TextStyle(fontSize: isMobile ? 13 : 15),
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "cannot return an empty value";
                      } else if (int.parse(value) < 10 ||
                          int.parse(value) > 365) {
                        return "Days must be between 10-265 days";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hint: Text(
                        "e.g., Emergency Fund, Vacation Savings",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isMobile ? 11 : 13,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Savings Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 13 : 15,
              ),
            ),
            SizedBox(height: spacing),
            TextFormField(
              style: TextStyle(fontSize: isMobile ? 13 : 15),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: amountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "cannot return an empty value";
                } else if (int.parse(value) < 10 || int.parse(value) > 365) {
                  return "Days must be between 10-265 days";
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.currency_bitcoin_rounded),
                hint: Text(
                  "0",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isMobile ? 11 : 13,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            canSubmit?Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100,
              ),
              padding: EdgeInsets.all(spacing*2),
              margin: EdgeInsets.symmetric(vertical: spacing*3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Plan Preview", style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: spacing*2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tenure", style: TextStyle(fontSize: isMobile?12:14),),
                      Text(
                        (context.read<DigiLockProvider>().getDays()>=9 && context.read<DigiLockProvider>().getDays() <= 30) ? "10-30 days" : (context.read<DigiLockProvider>().getDays()>=31 && context.read<DigiLockProvider>().getDays() <= 60)? "31-60 days" : (context.read<DigiLockProvider>().getDays()>=61 && context.read<DigiLockProvider>().getDays() <= 90)? "61-90 days" : (context.read<DigiLockProvider>().getDays()>=91 && context.read<DigiLockProvider>().getDays() <= 180) ? "91-180 days" : "181-365 days", style: TextStyle(fontSize: isMobile?11:13, fontWeight: FontWeight.bold),
                       ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Interest rate", style: TextStyle(fontSize: isMobile?12:14),),
                      Text(
                        (context.read<DigiLockProvider>().getDays()>=9 && context.read<DigiLockProvider>().getDays() <= 30) ? "14% p.a" : (context.read<DigiLockProvider>().getDays()>=31 && context.read<DigiLockProvider>().getDays() <= 60)? "14.5% p.a" : (context.read<DigiLockProvider>().getDays()>=61 && context.read<DigiLockProvider>().getDays() <= 90)? "15.5% p.a" : (context.read<DigiLockProvider>().getDays()>=91 && context.read<DigiLockProvider>().getDays() <= 180) ? "17% p.a" : "21% p.a", style: TextStyle(fontSize: isMobile?11:13, fontWeight: FontWeight.bold),
                       ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Duration", style: TextStyle(fontSize: isMobile?12:14),),
                      Text("${context.read<DigiLockProvider>().getDays()} days",style: TextStyle(fontSize: isMobile?11:13, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Expected Interest",style: TextStyle(fontSize: isMobile?12:14),),
                      Text("₦55.678",style: TextStyle(fontSize: isMobile?11:13, fontWeight: FontWeight.bold, color: Colors.green))
                    ],
                  )
                ],
              ),
            ):Container(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: canSubmit ? Colors.pink : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          onPressed: () {
            canSubmit?Navigator.push(context, MaterialPageRoute(builder: (context)=>InterestPaymentMethod())):null;
          },
          child: Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
