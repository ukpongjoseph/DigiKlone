import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/account_and_security_expanded.dart';
import 'package:second_flutter/components/faq_card.dart';
import 'package:second_flutter/components/help.dart';
import 'package:second_flutter/components/referral_and_rewards.dart';
import 'package:second_flutter/components/savings_and_interest.dart';
import 'package:second_flutter/components/transactions_and_payment.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FAQ", style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: isMobile ? 17 : 20,),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: theme.colorScheme.surfaceContainerHigh,
          child: Container(  
            margin: EdgeInsets.all(spacing * 2.5),
            child: Column(
              children: [
                FaqCard(),
                SizedBox(height: spacing,),
                AccountAndSecurityExpanded(),
                SizedBox(height: spacing,),
                SavingsAndInterest(),
                SizedBox(height: spacing,),
                TransactionsAndPayment(),
                SizedBox(height: spacing,),
                ReferralAndRewards(),
                Help()
              ],
            ),
          ),
        ),
      )
    );
  }
}