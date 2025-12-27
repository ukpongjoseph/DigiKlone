import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/danger_zone.dart';
import 'package:second_flutter/components/profile_image_card.dart';
import 'package:second_flutter/components/refer_and_earn.dart';
import 'package:second_flutter/pages/edit_profile.dart';
import 'package:second_flutter/pages/faq.dart';
import 'package:second_flutter/pages/kyc_verification.dart';
import 'package:second_flutter/pages/notification_page.dart';
import 'package:second_flutter/pages/payment_methods.dart';
import 'package:second_flutter/pages/profile_preference.dart';
import 'package:second_flutter/pages/security.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/pages/support.dart';
import 'package:second_flutter/theme/app_theme.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    void navToEditProfile() {
      if (!mounted) return;
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfile()),
        );
      });
    }

    void navToNotifications() {
      if (!mounted) return;
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationPage()),
        );
      });
    }

    void navToPaymentMethods() {
      if (!mounted) return;
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentMethods()),
        );
      });
    }

    void navToKycVerificationPage() {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KycVerification()),
        );
      });
    }

    void navToSecurityPage() {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Security()),
        );
      });
    }

    void navToFaqPage() {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Faq()));
      });
    }

    void navToSupportPage() {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Support()),
        );
      });
    }

    ThemeData themeData = context.read<ThemeProvider>().getTheme();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: themeData.colorScheme.outline,
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: themeData.colorScheme.surface,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  icon: Icon(Icons.logout_rounded, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileImageCard(),
              doubleProfilePageCustomWidget(
                "Account",
                "Profile",
                "Notifications",
                "Name, email, phone, and more",
                "Manage your notifications",
                Icons.person_2_outlined,
                Icons.notifications_none,
                navToEditProfile,
                navToNotifications,
              ),
              ProfilePreference(),
              doubleProfilePageCustomWidget(
                "Security & Privacy",
                "KYC Verification",
                "Security",
                "Complete your identity verification",
                "Password, PIN, 2FA, and security questions",
                Icons.shield_outlined,
                Icons.shield_outlined,
                navToKycVerificationPage,
                navToSecurityPage,
              ),
              singleProfilePageCustomWidget(
                "Payment & Banking",
                "Payment Methods",
                "Cards, bank accounts, and virtual account",
                Icons.chevron_right_outlined,
                Icons.wallet_sharp,
                navToPaymentMethods,
              ),
              doubleProfilePageCustomWidget(
                "Support",
                "FAQ",
                "Contact Support",
                "Find answers to common questions",
                "Get help from our support team",
                Icons.question_mark_rounded,
                Icons.chat_bubble_outline,
                navToFaqPage,
                navToSupportPage,
              ),
              ReferAndEarn(),
              DangerZone(),
            ],
          ),
        ),
      ),
    );
  }

  Widget doubleProfilePageCustomWidget(
    String title,
    String firstTiletext,
    String secondTiletext,
    String firstTileSubtitle,
    String secondTileSubtitle,
    IconData firstIcon,
    IconData secondIcon,
    VoidCallback firstTileFunction,
    VoidCallback secondTileFunction, {
    Color? tilecolor,
  }) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: isMobile ? 8 : 11)),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1.5, color: theme.colorScheme.outline),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: firstTileFunction,
                child: Container(
                  padding: EdgeInsets.all(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.5,
                                color: theme.colorScheme.outline,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: theme == lightTheme
                                  ? theme.colorScheme.secondaryFixedDim
                                  : theme.colorScheme.surfaceContainerHighest,
                              child: Icon(
                                firstIcon,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing * 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                firstTiletext,
                                style: TextStyle(
                                  fontSize: isMobile ? 13 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                firstTileSubtitle,
                                style: TextStyle(
                                  fontSize: isMobile ? 10 : 13,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: isMobile ? 20 : 25,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: theme.colorScheme.outline),
              GestureDetector(
                onTap: secondTileFunction,
                child: Container(
                  padding: EdgeInsets.all(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.5,
                                color: theme.colorScheme.outline,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: theme == lightTheme
                                  ? theme.colorScheme.secondaryFixedDim
                                  : theme.colorScheme.surfaceContainerHighest,
                              child: Icon(
                                secondIcon,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing * 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                secondTiletext,
                                style: TextStyle(
                                  fontSize: isMobile ? 13 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                secondTileSubtitle,
                                style: TextStyle(
                                  fontSize: isMobile ? 10 : 13,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: isMobile ? 20 : 25,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget singleProfilePageCustomWidget(
    String title,
    String tileText,
    String tileSubtitleTExt,
    IconData tileIcon,
    IconData avatarIcon,
    VoidCallback callBackFunction, {
    Color? tileColor,
  }) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: isMobile ? 8 : 11)),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 13 : 15,
          ),
        ),
        GestureDetector(
          onTap: callBackFunction,
          child: Container(
            padding: EdgeInsets.all(isMobile ? 8 : 11),
            margin: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color:
                  tileColor ??
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1.5,
                color: tileColor ?? theme.colorScheme.outline,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: tileColor ?? theme.colorScheme.outline,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: theme == lightTheme
                            ? theme.colorScheme.secondaryFixedDim
                            : theme.colorScheme.surfaceContainerHighest,
                        child: Icon(
                          avatarIcon,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    SizedBox(width: spacing * 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tileText,
                          style: TextStyle(
                            fontSize: isMobile ? 13 : 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tileSubtitleTExt,
                          style: TextStyle(
                            fontSize: isMobile ? 10 : 13,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  tileIcon,
                  size: isMobile ? 20 : 25,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
