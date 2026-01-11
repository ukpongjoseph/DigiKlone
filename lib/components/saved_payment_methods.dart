import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class SavedPaymentMethods extends StatefulWidget {
  const SavedPaymentMethods({super.key});

  @override
  State<SavedPaymentMethods> createState() => _SavedPaymentMethodsState();
}

class _SavedPaymentMethodsState extends State<SavedPaymentMethods> {
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
          "Saved Payment Methods",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 16,
          ),
        ),
        SizedBox(height: spacing * 2),
        Container(
          padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: theme == lightTheme
                  ? [
                      const Color(0xFF0F172A),
                      const Color(0xFF0F172A),
                      const Color(0xFF0F172A),
                    ]
                  : [
                      const Color(0xFF0F172A),
                      const Color.fromARGB(255, 32, 49, 89),
                      const Color.fromARGB(255, 43, 66, 119),
                    ],
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.5,
              color: theme == lightTheme
                  ? const Color(0xFF0F172A)
                  : const Color(0xFF0F172A),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Visa", style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      minimumSize: Size.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Default",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 9 : 11,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing * 2),
              Text(
                "**** **** **** 4532",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: spacing * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cardholder",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isMobile ? 9 : 11,
                        ),
                      ),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 11 : 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expires",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isMobile ? 9 : 11,
                        ),
                      ),
                      Text(
                        "12/26",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 11 : 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: spacing * 4),
            ],
          ),
        ),
      ],
    );
  }
}
