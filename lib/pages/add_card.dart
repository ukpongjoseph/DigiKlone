import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/payment_virtual_account.dart';
import 'package:second_flutter/components/saved_payment_methods.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment Methods",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 17 : 20,
          ),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentVirtualAccount(),
              SizedBox(height: spacing * 2,),
              SavedPaymentMethods()
            ],
          ),
        ),
      ),
    );
  }
}