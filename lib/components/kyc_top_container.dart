import 'package:flutter/material.dart';

class KycTopContainer extends StatelessWidget {
  final ThemeData theme;
  final double spacing;
  final bool isMobile;
  final double screenWidth;
  const KycTopContainer({
    super.key,
    required this.theme,
    required this.spacing,
    required this.isMobile,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing * 2),
      margin: EdgeInsets.symmetric(vertical: spacing),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing),
            child: Icon(
              Icons.shield_outlined,
              color: Colors.blue.shade900,
              size: isMobile ? 30 : 35,
            ),
          ),
          Text(
            "Know Your Customer",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 15 : 17,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing),
            child: Text(
              "Complete your KYC verification to unlock all DigiKolo features and increase your transaction limits",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: isMobile ? 12 : 14,
              ),
            ),
          ),
          Text(
            "Verification Process",
            style: TextStyle(
              fontSize: isMobile ? 11 : 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing),
            child: LinearProgressIndicator(
              value: 0.0,
              backgroundColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            "0 of 2 completed",
            style: TextStyle(fontSize: isMobile ? 11 : 13),
          ),
        ],
      ),
    );
  }
}
