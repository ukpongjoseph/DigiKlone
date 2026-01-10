import 'package:flutter/material.dart';

class PaymentVirtualAccount extends StatefulWidget {
  const PaymentVirtualAccount({super.key});

  @override
  State<PaymentVirtualAccount> createState() => _PaymentVirtualAccountState();
}

class _PaymentVirtualAccountState extends State<PaymentVirtualAccount> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Virtual Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 14 : 16),),
        Container(
          padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green[200],
                    child: Icon(Icons.wallet, color: Colors.green[800],),
                  ),
                  SizedBox(width: spacing * 2,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DigiKolo Virtual Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 14),),
                      Text("Use this account to fund your wallet", style: TextStyle(fontSize: isMobile ? 10 : 12),),
                    ],
                  )
                ],
              ),
              SizedBox(height: spacing,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Account Number", style: TextStyle(fontSize: isMobile ? 12 : 14),),
                  Text("9234567890", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 14),)
                ],
              ),
              SizedBox(height: spacing,),
                           Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bank Name", style: TextStyle(fontSize: isMobile ? 12 : 14),),
                  Text("Providus Bank", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 14),)
                ],
              ),
              SizedBox(height: spacing,),
                           Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Account Name", style: TextStyle(fontSize: isMobile ? 12 : 14),),
                  Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 14),)
                ],
              ),
              SizedBox(height: spacing,),
            ],
          ),
        )
      ],
    );
  }
}