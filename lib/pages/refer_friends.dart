import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class ReferFriends extends StatefulWidget {
  const ReferFriends({super.key});

  @override
  State<ReferFriends> createState() => _ReferFriendsState();
}

class _ReferFriendsState extends State<ReferFriends> {
  void copyToClipBoard(String textToCopy) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
  }

  void showCopyToClipBoardDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Copied!"),
          content: Text("Referral code copied to clipboard"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void handleCopyToClipBoard() {
    copyToClipBoard("DKG8H9K2L");
    showCopyToClipBoardDialog();
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
        title: Text(
          "Refer & Earn",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 17 : 20,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: theme.colorScheme.secondaryFixedDim,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.wallet_giftcard_outlined,
                      size: isMobile ? 25 : 30,
                    ),
                    SizedBox(height: spacing * 1.5),
                    Text(
                      "Tota Earnings",
                      style: TextStyle(fontSize: isMobile ? 12 : 14),
                    ),
                    SizedBox(height: spacing * 1.5),
                    Text(
                      "₦4,200",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 22 : 25,
                      ),
                    ),
                    SizedBox(height: spacing * 1.5),
                    Text(
                      "From 21 successful referrals",
                      style: TextStyle(fontSize: isMobile ? 10 : 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customReferRow(
                    Icons.people_outlined,
                    "21",
                    "Total Referrals",
                    Colors.deepPurpleAccent,
                  ),
                  customReferRow(
                    Icons.trending_up_rounded,
                    "5",
                    "This Month",
                    Colors.green,
                  ),
                  customReferRow(
                    Icons.calendar_today_outlined,
                    "₦200",
                    "For Referral",
                    Colors.orange,
                  ),
                ],
              ),
              SizedBox(height: spacing * 2),
              Text(
                "Your Referral Code",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: spacing * 2),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1.5,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Share this code with friends"),
                        Text(
                          "DKG8H9K2L",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.secondaryFixedDim,
                            fontSize: isMobile ? 20 : 24,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              handleCopyToClipBoard();
                            },
                            icon: Icon(Icons.copy),
                          ),
                        ),
                        SizedBox(width: spacing),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing * 2),
              Container(
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How it Works",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: spacing),
                    customWork(
                      "1",
                      "Share your code",
                      "Send your referral code to friends and family",
                    ),
                    SizedBox(height: spacing * 2),
                    customWork(
                      "2",
                      "Friend signs up",
                      "They create an account using your referral",
                    ),
                    SizedBox(height: spacing * 2),
                    customWork(
                      "3",
                      "You both earn",
                      "Both of you recieve ₦200 bonus in your wallet",
                    ),
                    SizedBox(height: spacing * 2),
                  ],
                ),
              ),
              SizedBox(height: spacing * 2),
              Text(
                "Recent Referrals",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: spacing * 2),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1.5,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                child: Column(
                  children: [
                    customRecentReferrals(
                      "completed",
                      "₦200",
                      "Adebayo Johnson",
                      "2026-01-06 18:21:32.384",
                    ),
                    Divider(),
                    customRecentReferrals(
                      "completed",
                      "₦200",
                      "Kemi Oladele",
                      "2026-01-12 13:21:32.384",
                    ),
                    Divider(),
                    customRecentReferrals(
                      "completed",
                      "₦200",
                      "David Okafor",
                      "2026-01-17 16:21:32.384",
                    ),
                    Divider(),
                    customRecentReferrals(
                      "pending",
                      "₦200",
                      "Sarah Ahmed",
                      "2026-01-21 11:21:32.384",
                    ),
                    Divider(),
                    customRecentReferrals(
                      "completed",
                      "₦200",
                      "Michael Benson",
                      "2026-01-27 10:21:32.384",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget customReferRow(
    IconData icon,
    String title,
    String subtitle,
    Color iconColor,
  ) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Container(
      width: screenWidth * 0.3,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.surfaceContainerHighest,
        border: Border.all(
          width: 1.5,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor),
          SizedBox(height: isMobile ? 5 : 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(fontSize: isMobile ? 10 : 12)),
        ],
      ),
    );
  }

  Widget customWork(String index, String title, String subtitle) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Row(
      children: [
        CircleAvatar(
          radius: isMobile ? 15 : 17,
          child: Text(
            index,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
        ),
        SizedBox(width: spacing * 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
            SizedBox(height: spacing / 2),
            Text(subtitle, style: TextStyle(fontSize: isMobile ? 11 : 13)),
          ],
        ),
      ],
    );
  }

  Widget customRecentReferrals(
    String status,
    String amount,
    String name,
    String transactionTime,
  ) {
    DateTime date = DateTime.parse(transactionTime);
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      padding: isMobile ? EdgeInsets.all(7) : EdgeInsets.all(9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text(
                  name[0].toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 15,
                  ),
                ),
              ),
              SizedBox(width: spacing * 1.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 13 : 15,
                    ),
                  ),
                  Text(
                    DateFormat("MMM dd, h:mm a").format(date),
                    style: TextStyle(fontSize: isMobile ? 9 : 11),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  color: status == "completed"
                      ? Colors.green.shade900
                      : status == "pending"
                      ? Colors.orange.shade900
                      : Colors.red.shade900,
                  fontWeight: FontWeight.w900,
                  fontSize: isMobile ? 11 : 14,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  color: status == "completed"
                      ? Colors.green.shade900
                      : status == "pending"
                      ? Colors.orange.shade900
                      : Colors.red.shade900,
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 9 : 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
