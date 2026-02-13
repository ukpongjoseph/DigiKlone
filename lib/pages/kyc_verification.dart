import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/kyc_bottom_container.dart';
import 'package:second_flutter/components/kyc_bvn_card.dart';
import 'package:second_flutter/components/kyc_identity_verification_card.dart';
import 'package:second_flutter/components/kyc_top_container.dart';

class KycVerification extends StatefulWidget {
  const KycVerification({super.key});

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
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
          "KYC Verification",
          style: TextStyle(
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [Icon(Icons.info_outline)],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(spacing * 2),
          child: Column(
            children: [
              KycTopContainer(
                theme: theme,
                spacing: spacing,
                isMobile: isMobile,
                screenWidth: screenWidth,
              ),
              KycBvnCard(
                theme1: theme,
                spacing: spacing,
                isMobile: isMobile,
                screenWidth: screenWidth,
              ),
              KycIdentityVerificationCard(
                theme: theme,
                spacing: spacing,
                isMobile: isMobile,
                screenWidth: screenWidth,
              ),
              KycBottomContainer(
                theme: theme,
                screenWidth: screenWidth,
                isMobile: isMobile,
                spacing: spacing,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Your information is encrypted and stored securely according to banking regulations",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 10 : 13,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
