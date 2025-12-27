import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class ProfileImageCard extends StatefulWidget {
  const ProfileImageCard({super.key});

  @override
  State<ProfileImageCard> createState() => _ProfileImageCardState();
}

class _ProfileImageCardState extends State<ProfileImageCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      padding: isMobile
          ? EdgeInsets.symmetric(vertical: 10.0)
          : EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.colorScheme.outline, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(child: Image.asset("assets/images/avatar.png")),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(Icons.camera_alt_rounded, size: 13),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: spacing * 2),
          Text(
            "John Doe",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 17 : 22,
            ),
          ),
          SizedBox(height: spacing / 2),
          Text(
            "john.doe@example.com",
            style: TextStyle(
              fontSize: isMobile ? 10 : 12,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            "+234 808 123 4567",
            style: TextStyle(
              fontSize: isMobile ? 10 : 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
