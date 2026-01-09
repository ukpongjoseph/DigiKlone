import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  void displayDialog(String title, String dialogSubtitle, String buttontext) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(dialogSubtitle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(buttontext),
            ),
          ],
        );
      },
    );
  }

  bool isBioAuthSelected = false;
  bool isTwofactorEnabled = false;
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
          "Security",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 17 : 19,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(10),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.5, color: Colors.grey.shade100),
                ),
                padding: isMobile ? EdgeInsets.all(10) : EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 21,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(
                            backgroundColor: Colors.green[100],
                            child: Icon(
                              Icons.shield_outlined,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(width: spacing * 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Security Status",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                            Text(
                              "Your account is secure",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: isMobile ? 11 : 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "85%",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 20 : 23,
                          ),
                        ),
                        Text(
                          "Security Score",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: isMobile ? 11 : 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Security Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 15 : 17,
                    ),
                  ),
                  SizedBox(height: spacing * 2),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        customSecuritySettingsWithIconButton(
                          Icons.key,
                          "Change Password",
                          "Update your account password",
                          "You will be redirected to chnage your password",
                          "Continue",
                        ),
                        Divider(),
                        customSecuritySettingsWithIconButton(
                          Icons.phone_android_sharp,
                          "Setup PIN",
                          "Create a 4-digit PIN for quick access",
                          "Create a 4-digit PIN for quick access",
                          "Setup",
                        ),
                        Divider(),
                        firstCustomSecuritySettingswithToggleButton(
                          Icons.fingerprint,
                          "Biometric Authentication",
                          "Use fingerprint or face ID to unlock",
                        ),
                        Divider(),
                        secondCustomSecuritySettingswithToggleButton(
                          Icons.shield_outlined,
                          "Two Factor Authentication",
                          "Add an extra layer of security",
                        ),
                        Divider(),
                        customSecuritySettingsWithIconButton(
                          Icons.key,
                          "Security Question",
                          "Setup question for account recovery",
                          "Setup question for account recovery",
                          "Setup",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Emergency Access",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 15 : 17,
                ),
              ),
              SizedBox(height: spacing * 2),
              Container(
                padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: theme == lightTheme
                      ? Colors.amber.shade200
                      : theme.colorScheme.surfaceContainer,
                  border: Border.all(width: 1.5, color: Colors.amber.shade700),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account Recovery",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[900],
                      ),
                    ),
                    SizedBox(height: spacing),
                    Text(
                      "If you lose access to your account, you can recover it using your registered email or security question",
                      style: TextStyle(
                        fontSize: isMobile ? 10 : 12,
                        color: theme == lightTheme
                            ? Colors.amber[900]
                            : Colors.amber[50],
                      ),
                    ),
                    SizedBox(height: spacing),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        minimumSize: Size.zero,
                        backgroundColor: theme == darkTheme
                            ? Colors.amberAccent.shade400
                            : Colors.amber.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Test Recovery Process",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 10 : 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customSecuritySettingsWithIconButton(
    IconData icon,
    String title,
    String subtitle,
    String dialogSubtitleText,
    String buttontext,
  ) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Container(
      padding: isMobile ? EdgeInsets.all(2) : EdgeInsets.all(4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme == lightTheme
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHigh,
          child: Icon(icon, color: theme.colorScheme.secondaryFixedDim),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: isMobile ? 10 : 12),
        ),
        trailing: IconButton(
          onPressed: () {
            displayDialog(title, dialogSubtitleText, buttontext);
          },
          icon: Icon(Icons.chevron_right_rounded),
        ),
      ),
    );
  }

  Widget firstCustomSecuritySettingswithToggleButton(
    IconData icon,
    String title,
    String subtitle,
  ) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Container(
      padding: isMobile ? EdgeInsets.all(2) : EdgeInsets.all(4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme == lightTheme
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHigh,
          child: Icon(icon, color: theme.colorScheme.secondaryFixedDim),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: isMobile ? 10 : 12),
        ),
        trailing: Switch(
          value: isBioAuthSelected,
          inactiveTrackColor: Colors.grey,
          thumbColor: WidgetStateProperty.all(Colors.white),
          onChanged: (bool value) {
            setState(() {
              isBioAuthSelected = value;
            });
          },
        ),
      ),
    );
  }

  Widget secondCustomSecuritySettingswithToggleButton(
    IconData icon,
    String title,
    String subtitle,
  ) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Container(
      padding: isMobile ? EdgeInsets.all(2) : EdgeInsets.all(4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme == lightTheme
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHigh,
          child: Icon(icon, color: theme.colorScheme.secondaryFixedDim),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: isMobile ? 10 : 12),
        ),
        trailing: Switch(
          inactiveTrackColor: Colors.grey,
          value: isTwofactorEnabled,
          thumbColor: WidgetStateProperty.all(Colors.white),
          onChanged: (bool value) {
            setState(() {
              isTwofactorEnabled = value;
            });
          },
        ),
      ),
    );
  }
}
