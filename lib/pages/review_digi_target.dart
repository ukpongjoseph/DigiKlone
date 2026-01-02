import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/digi_target_providers.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/total_progress.dart';
import 'package:second_flutter/theme/app_theme.dart';

class ReviewDigitarget extends StatefulWidget {
  const ReviewDigitarget({super.key});

  @override
  State<ReviewDigitarget> createState() => _ReviewDigitargetState();
}

class _ReviewDigitargetState extends State<ReviewDigitarget> {
  late String savingsName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    savingsName = context.read<DigiTargetProviders>().getSavingsName();
  }

  void showSuccessSetTarget() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Target Created Successfully"),
          content: Text(
            "Your $savingsName savings target has been created successfully",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TotalProgress()),
                );
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  bool isButtonActive = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: Colors.grey.shade400),
            ),
          ),
        ),
        title: Text(
          "Review Your DigiTarget",
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
        ],
        automaticallyImplyLeading: false,
        actionsPadding: isMobile ? EdgeInsets.all(4) : EdgeInsets.all(6),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: isMobile
                    ? EdgeInsetsGeometry.symmetric(vertical: 10.0)
                    : EdgeInsetsGeometry.symmetric(vertical: 20),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.only(bottom: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.5, color: Colors.blue.shade700),
                  color: Colors.blue[700],
                ),
                child: Text(
                  savingsName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: isMobile ? (spacing * 2) : (spacing * 3),
                crossAxisSpacing: isMobile ? (spacing * 2) : (spacing * 3),
                childAspectRatio: 2.5,
                children: [
                  moneyInvolvedCustomDigiTargetCard(
                    "target Amount",
                    context.read<DigiTargetProviders>().getSavingsAmount(),
                  ),
                  moneyInvolvedCustomDigiTargetCard(
                    "Interest(18.5% p.a)",
                    "1.43",
                    providedBackgroundColor: Colors.green[400],
                    providedTextColor: Colors.green[900],
                  ),
                  moneyNotInvolvedCustomDigiTargetCard(
                    "Start Date",
                    context.read<DigiTargetProviders>().getStartDate(),
                  ),
                  moneyNotInvolvedCustomDigiTargetCard(
                    "End Date",
                    context.read<DigiTargetProviders>().getEndDate(),
                  ),
                  moneyInvolvedCustomDigiTargetCard(
                    context.read<DigiTargetProviders>().getSavingsFrequency(),
                    "24000",
                  ),
                  moneyNotInvolvedCustomDigiTargetCard(
                    "Automation",
                    context.read<DigiTargetProviders>().getPlanAutomation()
                        ? "Active"
                        : "inactive",
                    providedBackgroundColor: Colors.green[400],
                    providedTextColor: Colors.green[900],
                  ),
                ],
              ),
              SizedBox(height: spacing * 4),
              Container(
                decoration: BoxDecoration(
                  color: theme == lightTheme
                      ? Colors.amber[300]
                      : const Color.fromARGB(255, 86, 83, 58),
                  border: Border.all(width: 1.5, color: Colors.amber.shade600),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isButtonActive,
                      checkColor: Colors.green[900],
                      activeColor: Colors.green[400],
                      side: BorderSide(
                        color: isButtonActive
                            ? Colors.green.shade600
                            : Colors.grey.shade600,
                        width: 1.5,
                      ),
                      onChanged: (value) {
                        setState(() {
                          isButtonActive = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "I agree that early withdrawal of this savings will be subject to a 1.75% penalty",
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.amber[900],
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
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1.5, color: Colors.blue.shade700),
                  ),
                ),
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ),
            SizedBox(width: spacing * 2),
            Expanded(
              child: ElevatedButton(
                onPressed: () => isButtonActive ? showSuccessSetTarget() : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonActive
                      ? const Color.fromARGB(255, 53, 221, 62)
                      : Colors.grey[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1.5, color: Colors.grey.shade700),
                  ),
                ),
                child: Text(
                  "Create Target",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget moneyInvolvedCustomDigiTargetCard(
    String title,
    String value, {
    Color? providedBackgroundColor,
    Color? providedTextColor,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: providedBackgroundColor ?? theme.colorScheme.onTertiaryFixed,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 10 : 12,
              color: providedTextColor ?? null,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "₦$value",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 12 : 14,
              color: providedTextColor ?? null,
            ),
          ),
        ],
      ),
    );
  }

  Widget moneyNotInvolvedCustomDigiTargetCard(
    String firstText,
    String secondText, {
    Color? providedBackgroundColor,
    Color? providedTextColor,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: providedBackgroundColor ?? theme.colorScheme.onTertiaryFixed,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstText,
            style: TextStyle(
              fontSize: isMobile ? 10 : 12,
              color: providedTextColor ?? null,
            ),
          ),
          SizedBox(height: 5),
          Text(
            secondText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 12 : 14,
              color: providedTextColor ?? null,
            ),
          ),
        ],
      ),
    );
  }
}
