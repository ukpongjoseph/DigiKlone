import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class ProfilePreference extends StatefulWidget {
  const ProfilePreference({super.key});

  @override
  State<ProfilePreference> createState() => _ProfilePreferenceState();
}

class _ProfilePreferenceState extends State<ProfilePreference> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Preference",
          style: TextStyle(
            fontSize: isMobile ? 13 : 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              context.read<ThemeProvider>().changeTheme();
            });
          },
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              border: Border.all(width: 1.5, color: theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(10),
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
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: theme == lightTheme
                            ? theme.colorScheme.secondaryFixedDim
                            : theme.colorScheme.surfaceContainerHighest,
                        child: Icon(
                          theme == lightTheme
                              ? Icons.phone_iphone_outlined
                              : Icons.dark_mode_outlined,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    SizedBox(width: spacing * 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appearance",
                          style: TextStyle(
                            fontSize: isMobile ? 13 : 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          theme == lightTheme ? "System (Light)" : "Dark Mode",
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
                  Icons.fiber_manual_record,
                  size: isMobile ? 20 : 25,
                  color: theme == lightTheme
                      ? Colors.grey.shade500
                      : theme.colorScheme.secondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
