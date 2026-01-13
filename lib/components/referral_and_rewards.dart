import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class ReferralAndRewards extends StatefulWidget {
  const ReferralAndRewards({super.key});

  @override
  State<ReferralAndRewards> createState() => _ReferralAndRewardsState();
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
    title: "When do i receive my referral bonus",
    body:
        "To create a digikolo account, download our app. tap Sign up. Enter your persosnal information. You will need to verify your personal info to activate your account",
    isExpanded: false,
  ),
  AccountExpanded(
    title: "How does the referral program work",
    body:
        "Yes, your money is completely safe with Digikolo . DigiKolo is fully licensed and regulated by the CBN, the Central bank of Nigeria",
    isExpanded: false,
  ),
];

class _ReferralAndRewardsState extends State<ReferralAndRewards> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: theme.colorScheme.surfaceContainerHigh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Referrals & Rewards",
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
