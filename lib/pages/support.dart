import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
          "Contact Support",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 30 : 40),
          color: theme.colorScheme.surfaceContainerHigh,
          child: Container(
            margin: EdgeInsets.all(isMobile ? 7 : 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                contactcard(),
                SizedBox(height: spacing * 4),
                Text(
                  "Quick Contact",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 15,
                  ),
                ),
                SizedBox(height: spacing * 2),
                customListTile(
                  Colors.green.shade100,
                  Colors.green,
                  Icons.phone,
                  "Call Us",
                  "+234 700 0000 0000",
                ),
                customListTile(
                  Colors.purple.shade100,
                  Colors.purpleAccent,
                  Icons.email_outlined,
                  "Email",
                  "support@digiKolo.com",
                ),
                SizedBox(height: spacing),
                Text(
                  "Follow Us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 15,
                  ),
                ),
                SizedBox(height: spacing),
                customSocialListTile(
                  Colors.red.shade100,
                  Colors.red,
                  FontAwesomeIcons.instagram,
                  "Instagram",
                  "@digikolo.ng",
                ),
                customSocialListTile(
                  Colors.blue.shade100,
                  Colors.blue,
                  FontAwesomeIcons.facebookF,
                  "Facebook",
                  "@digikolo",
                ),
                customSocialListTile(
                  theme.colorScheme.surfaceContainerHigh,
                  Colors.grey,
                  FontAwesomeIcons.twitter,
                  "Twitter",
                  "@digikolo.ng",
                ),
                SizedBox(height: spacing * 2),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.5, color: Colors.green),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.watch_later_outlined, color: Colors.green),
                      SizedBox(width: spacing),
                      Text(
                        "Typical response time: 2-4 hours during business hours",
                        style: TextStyle(
                          fontSize: isMobile ? 9 : 11,
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing * 3),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(isMobile ? 7 : 9),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    border: Border.all(
                      width: 1.5,
                      color: theme.colorScheme.surfaceContainerHighest,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Support Hours",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 13 : 15,
                        ),
                      ),
                      SizedBox(height: spacing * 2),
                      Text(
                        "Monday - Friday: 8:00 AM - 8:00 PM (WAT)",
                        style: TextStyle(fontSize: isMobile ? 10 : 12),
                      ),
                      Text(
                        "Saturday: 9:00 AM - 5:00 PM (WAT)",
                        style: TextStyle(fontSize: isMobile ? 10 : 12),
                      ),
                      Text(
                        "Sunday: 10:00 AM - 4:00 PM (WAT)",
                        style: TextStyle(fontSize: isMobile ? 10 : 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing * 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contactcard() {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: theme == lightTheme
                ? Colors.purple.shade100
                : theme.colorScheme.surfaceContainerHighest,
            child: Icon(Icons.headset, color: theme.colorScheme.secondary),
          ),
          SizedBox(height: spacing),
          Text(
            "We are here to help!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 17 : 20,
            ),
          ),
          Text(
            "Get in touch with our customer support team and we'll respond as soon as possible",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: isMobile ? 12 : 14),
          ),
        ],
      ),
    );
  }

  Widget customListTile(
    Color avatarColor,
    Color iconColor,
    IconData icon,
    String tileTitle,
    String tileSubtitle,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.5, color: Colors.grey),
      ),
      child: ListTile(
        dense: true,
        minLeadingWidth: 6,
        minTileHeight: 10,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: CircleAvatar(
          radius: 21.5,
          backgroundColor: iconColor,
          child: CircleAvatar(
            backgroundColor: avatarColor,
            child: Icon(icon, color: iconColor),
          ),
        ),
        title: Text(tileTitle),
        subtitle: Text(tileSubtitle),
      ),
    );
  }

  Widget customSocialListTile(
    Color avatarColor,
    Color iconColor,
    IconData icon,
    String tileTitle,
    String tileSubtitle,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.5, color: Colors.grey),
      ),
      child: ListTile(
        dense: true,
        minLeadingWidth: 6,
        minTileHeight: 10,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: CircleAvatar(
          radius: 21.5,
          backgroundColor: iconColor,
          child: CircleAvatar(
            backgroundColor: avatarColor,
            child: FaIcon(icon, color: iconColor),
          ),
        ),
        title: Text(tileTitle),
        subtitle: Text(tileSubtitle),
      ),
    );
  }
}
