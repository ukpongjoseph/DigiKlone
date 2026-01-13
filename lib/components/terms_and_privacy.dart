import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class TermsAndPrivacy extends StatefulWidget {
  const TermsAndPrivacy({super.key});

  @override
  State<TermsAndPrivacy> createState() => _TermsAndPrivacyState();
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

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5:8;
    return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: theme.colorScheme.surfaceContainerHigh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Terms & Privacy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 15 : 17,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionPanelList(
              elevation: 0,
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  panelData[panelIndex].isExpanded = isExpanded;
                });
              },
              children: panelData.map((item) {
                return ExpansionPanel(
                  backgroundColor: theme.colorScheme.surfaceContainerHigh,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Padding(
                      padding: EdgeInsets.all(spacing),
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    );
                  },
                  body: Padding(
                    padding: EdgeInsets.all(spacing),
                    child: Text(item.body),
                  ),
                  isExpanded: item.isExpanded,
                  canTapOnHeader: true,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}