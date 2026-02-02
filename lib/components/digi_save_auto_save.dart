import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/auto_save_settings_page.dart';
import 'package:second_flutter/pages/set_up_auto_save_page.dart';

class DigiSaveAutoSave extends StatefulWidget {
  const DigiSaveAutoSave({super.key});

  @override
  State<DigiSaveAutoSave> createState() => _DigiSaveAutoSaveState();
}

class _DigiSaveAutoSaveState extends State<DigiSaveAutoSave> {
  void displayAutoSaveSwitchModal() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Auto-save Paused"),
          content: Text("Your automatic savings have been paused"),
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

  bool isAutoSaveActive = true;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Auto-save",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: isAutoSaveActive
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 20, 26, 215),
                        child: Icon(
                          Icons.play_circle_outline_outlined,
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Auto-save Active",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.5,
                                ),
                              ),
                              Text(
                                "₦5,000 weekly",
                                style: TextStyle(fontSize: 10.5),
                              ),
                              Text(
                                "Next transfer: Jan 15, 2025",
                                style: TextStyle(fontSize: 10.5),
                              ),
                            ],
                          ),
                          Switch(
                            activeTrackColor: const Color.fromARGB(
                              255,
                              33,
                              37,
                              243,
                            ),
                            value: isAutoSaveActive,
                            onChanged: (value) {
                              displayAutoSaveSwitchModal();
                              setState(() {
                                isAutoSaveActive = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AutoSaveSettingsPage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            border: Border.all(width: 1.5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Manage Settings",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                    255,
                                    107,
                                    33,
                                    243,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color: const Color.fromARGB(255, 107, 33, 243),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetUpAutoSavePage(),
                        ),
                      );
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      minLeadingWidth: 0,
                      minTileHeight: 0,
                      minVerticalPadding: 0,
                      horizontalTitleGap: 5,
                      leading: CircleAvatar(child: Icon(Icons.calendar_month)),
                      title: Text(
                        "Setup Auto-save",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        "Automatically save daily, weekly or monthly",
                        style: TextStyle(fontSize: 10.5),
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                    ),
                  ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
