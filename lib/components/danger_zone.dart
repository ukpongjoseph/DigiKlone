import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/home_page.dart';
import 'package:second_flutter/theme/app_theme.dart';

class DangerZone extends StatefulWidget {
  const DangerZone({super.key});

  @override
  State<DangerZone> createState() => _DangerZoneState();
}

class _DangerZoneState extends State<DangerZone> {
  @override
  Widget build(BuildContext context) {
    void finalMessageDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Account Deleted"),
            content: Text(
              "Your account has been deleted permanently deleted. We're sorry to see you go",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text("OK", style: TextStyle(color: Colors.blue[900])),
              ),
            ],
          );
        },
      );
    }

    void displayFinalDeletewarning() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Final Confirmation"),
            content: Column(
              children: [
                Text(
                  "This is your final warning. deleting your account will permanently remove : ",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 5.0),
                Text(
                  ".All your savings and investments",
                  style: TextStyle(fontSize: 12),
                ),
                Text(".Transaction history", style: TextStyle(fontSize: 12)),
                Text(".Personal data", style: TextStyle(fontSize: 12)),
                Text(
                  ". Access to DigiKolo services",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Type 'DELETE' to confirm or CANCEL to keep your account.",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            actions: [
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      finalMessageDialog();
                    },
                    child: Text(
                      "Delete Forever",
                      style: TextStyle(color: Colors.red[700]),
                    ),
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    void displayDangerZoneWarning() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Delete Account"),
            content: Text(
              "Are you sure you want to delete your account? This action cannot be undone and you will lose all your data, savings, and transaction history",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  displayFinalDeletewarning();
                },
                child: Text(
                  "Delete Account",
                  style: TextStyle(color: Colors.red[700]),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue[900]),
                ),
              ),
            ],
          );
        },
      );
    }

    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return GestureDetector(
      onTap: displayDangerZoneWarning,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: isMobile ? 8 : 11)),
          Text(
            "Danger Zone",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 13 : 15,
              color: theme.colorScheme.error,
            ),
          ),
          Container(
            padding: EdgeInsets.all(isMobile ? 8 : 11),
            margin: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.5, color: theme.colorScheme.error),
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
                          color: theme.colorScheme.error,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: theme == lightTheme
                            ? Colors.red[100]
                            : theme.colorScheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.delete_forever,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                    SizedBox(width: spacing * 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delete Account",
                          style: TextStyle(
                            fontSize: isMobile ? 13 : 15,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.error,
                          ),
                        ),
                        Text(
                          "Permanently delete your account and all data",
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
                  color: theme.colorScheme.error,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
