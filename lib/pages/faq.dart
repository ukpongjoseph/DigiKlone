import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/account_and_security_expanded.dart';
import 'package:second_flutter/components/faq_card.dart';
import 'package:second_flutter/components/help.dart';
import 'package:second_flutter/components/referral_and_rewards.dart';
import 'package:second_flutter/components/savings_and_interest.dart';
import 'package:second_flutter/components/terms_and_privacy.dart';
import 'package:second_flutter/components/transactions_and_payment.dart';

class Faq extends StatefulWidget {

  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}
class AccountExpanded {
  AccountExpanded({
    required this.title,
    required this.body,
    required this.isExpanded,
  });
  String title;
  String body;
  bool isExpanded;
}



class _FaqState extends State<Faq> {
   bool itemFound = true;
  // final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  late AccountExpanded searchQuery;
  List<AccountExpanded> panelData = [
  AccountExpanded(
    title: "Where can i find DigiKolo's Terms and Conditions",
    body:
        "To create a digikolo account, download our app. tap Sign up. Enter your persosnal information. You will need to verify your personal info to activate your account",
    isExpanded: false,
  ),
  AccountExpanded(
    title: "How does DigiKolo protect my personal information",
    body:
        "Yes, your money is completely safe with Digikolo . DigiKolo is fully licensed and regulated by the CBN, the Central bank of Nigeria",
    isExpanded: false,
  ),
    AccountExpanded(
    title: "Can i delete my personal data from DigiKolo",
    body:
        "To create a digikolo account, download our app. tap Sign up. Enter your persosnal information. You will need to verify your personal info to activate your account",
    isExpanded: false,
  ),
  AccountExpanded(
    title: "How often are the Terms and Privacy Policy updated",
    body:
        "Yes, your money is completely safe with Digikolo . DigiKolo is fully licensed and regulated by the CBN, the Central bank of Nigeria",
    isExpanded: false,
  ),
    AccountExpanded(
    title: "What happens if i voilate the Terms and Conditions",
    body:
        "To create a digikolo account, download our app. tap Sign up. Enter your persosnal information. You will need to verify your personal info to activate your account",
    isExpanded: false,
  )
]; 
  void searchForFaq(String textToBeFound){
    // AccountExpanded result = panelData.firstWhere((i) => i.title==textToBeFound);
    // if(_formKey.currentState!.validate()){
    //   print(result);
    // }
    setState(() {
      if(textToBeFound.isEmpty){
        itemFound = true;
        return;
      }
      try {
        AccountExpanded result = panelData.firstWhere((i) => i.title==textToBeFound);
        itemFound = true;
        searchQuery = result;
        // print(searchQuery);
      } catch (e) {
        itemFound = false;
        searchQuery = AccountExpanded(title: "No rsult", body: "Sorry, we couldn't find the result to yor search", isExpanded: false);
        // print(searchQuery);
        return;
      }
    });
  }
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
                FaqCard(
                  controller: _searchController,
                  onSearch: searchForFaq,
                ),
                SizedBox(height: spacing*3,),
                itemFound ? 
                Column(
                  children: [ 
                    SizedBox(height: spacing,),
                    AccountAndSecurityExpanded(),
                    SizedBox(height: spacing,),
                    SavingsAndInterest(),
                    SizedBox(height: spacing,),
                    TransactionsAndPayment(),
                    SizedBox(height: spacing,),
                    ReferralAndRewards(),
                    SizedBox(height: spacing,),
                    TermsAndPrivacy()
                  ],
                ) : 
                Center(
                  child: SizedBox(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHigh,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.5,
                                color: Colors.grey.shade700
                              )
                            ),
                            child: Icon(Icons.question_mark, color: Colors.grey.shade700,),
                          ),
                        ),
                        SizedBox(height: spacing,),
                        Text("No results found", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 15:17),),
                        SizedBox(height: spacing,),
                        Text("Try searching with different keywords or contact our support team for help", textAlign: TextAlign.center, style: TextStyle(fontSize: isMobile ? 12:14),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spacing*4,),
                Help(),
                SizedBox(height: spacing * 8,)
              ],
            ),
          ),
        ),
      )
    );
  }
}