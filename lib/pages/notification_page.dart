import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool pushInitValue = true;
  bool emailInitValue = true;
  bool alertInitValue = true;
  bool savingsInitValue = true;
  bool marketingInitValue = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme == lightTheme
            ? const Color.fromARGB(255, 245, 246, 247)
            : const Color.fromARGB(255, 19, 19, 19),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 18 : 20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(spacing * 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: theme == lightTheme
                ? [
                    const Color.fromARGB(255, 245, 246, 247),
                    const Color.fromARGB(255, 248, 248, 248),
                  ]
                : [
                    const Color.fromARGB(255, 19, 19, 19),
                    const Color.fromARGB(255, 0, 0, 0),
                  ],
          ),
        ),
        child: Column(
          children: [
            Text(
              "Manage how you recieve notifications and updates from DigiKolo",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: spacing * 4),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  singleNotification(
                    "Push Notification",
                    "Get notifications on your device",
                    Icons.phone_android_sharp,
                    pushInitValue,
                    (value) {
                      setState(() {
                        pushInitValue = value;
                      });
                    },
                  ),
                  Divider(color: Colors.grey),
                  singleNotification(
                    "Email Notification",
                    "Receive notifications via email",
                    Icons.email_outlined,
                    emailInitValue,
                    (value) {
                      setState(() {
                        emailInitValue = value;
                      });
                    },
                  ),
                  Divider(color: Colors.grey),
                  singleNotification(
                    "Transaction Alerts",
                    "Get notified about all transactions",
                    Icons.monetization_on_outlined,
                    alertInitValue,
                    (value) {
                      setState(() {
                        alertInitValue = value;
                      });
                    },
                  ),
                  Divider(color: Colors.grey),
                  singleNotification(
                    "savings Reminders",
                    "Reminders to save and reach your goals",
                    Icons.notification_add_outlined,
                    savingsInitValue,
                    (value) {
                      setState(() {
                        savingsInitValue = value;
                      });
                    },
                  ),
                  Divider(color: Colors.grey),
                  singleNotification(
                    "Marketing Emails",
                    "Promotional offers and updates",
                    Icons.email_outlined,
                    marketingInitValue,
                    (value) {
                      setState(() {
                        marketingInitValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(spacing * 4),
                  backgroundColor: theme == lightTheme
                      ? Colors.white
                      : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1.5, color: Colors.grey),
                  ),
                ),
                onPressed: () {},
                child: Text("View Notification History"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleNotification(
    String title,
    String subTitile,
    IconData icon,
    bool initSwitchValue,
    ValueChanged callback,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return ListTile(
      minLeadingWidth: spacing,
      minVerticalPadding: 0,
      minTileHeight: 0,
      dense: true,
      contentPadding: EdgeInsets.all(spacing),
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(title),
      subtitle: Text(subTitile),
      trailing: Switch(value: initSwitchValue, onChanged: callback),
    );
  }
}
