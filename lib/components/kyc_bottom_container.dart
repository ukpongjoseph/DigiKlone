import 'package:flutter/material.dart';

class KycBottomContainer extends StatelessWidget {
  final ThemeData theme;
  final double spacing;
  final bool isMobile;
  final double screenWidth;
  const KycBottomContainer({
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
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Benefits of KYC Verification",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
          SizedBox(height: spacing),
          customListTile("Higher transaction limits"),
          customListTile("Access to premium savings products"),
          customListTile("Enhanced account security"),
          customListTile("Priority customer suppoert"),
        ],
      ),
    );
  }

  Widget customListTile(String text) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      minLeadingWidth: 0,
      minTileHeight: 0,
      minVerticalPadding: spacing,
      leading: Icon(Icons.check_circle_outline, color: Colors.green),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: isMobile ? 11 : 13,
        ),
      ),
    );
  }
}
