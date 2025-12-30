import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class DigiTargetSavings extends StatefulWidget {
  const DigiTargetSavings({super.key});

  @override
  State<DigiTargetSavings> createState() => _DigiTargetSavingsState();
}

class _DigiTargetSavingsState extends State<DigiTargetSavings> {
  final _formkey = GlobalKey<FormState>();
  final savingsName = TextEditingController();
  final targetAmount = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  Future<void> selectDate(TextEditingController textController) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        textController.text = selectedDate.toString().split(" ")[0];
      });
    }
  }

  int selectedIndex = 1;

  @override
  void dispose() {
    savingsName.dispose();
    targetAmount.dispose();
    startDate.dispose();
    endDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create DigiTarget Savings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 16 : 18,
              ),
            ),
            SizedBox(height: spacing * 4),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldWidgetWithoutDate(
                        "Savings name",
                        "Enter savings name (e.g., rent)",
                        savingsName,
                      ),
                      SizedBox(height: spacing * 2),
                      formFieldWidgetWithoutDate(
                        "Target Amount",
                        "₦10,000",
                        targetAmount,
                      ),
                      SizedBox(height: spacing * 2),
                    ],
                  ),
                  SizedBox(height: spacing * 2),
                  formFieldWithDate("Start date", "29 Aug 2025", () {
                    selectDate(startDate);
                  }, startDate),
                  SizedBox(height: spacing * 2),
                  formFieldWithDate("End date", "30 Sep 2025", () {
                    selectDate(endDate);
                  }, endDate),
                  SizedBox(height: spacing * 2),
                  Text(
                    "How often will you save ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ),
                  Row(
                    children: [
                      frequencyButtons("Daily", 0),
                      SizedBox(width: spacing),
                      frequencyButtons("Weekly", 1),
                      SizedBox(width: spacing),
                      frequencyButtons("Monthly", 2),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget formFieldWidgetWithoutDate(
    String label,
    String hint,
    TextEditingController textController,
  ) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 12 : 14,
          ),
        ),
        SizedBox(height: spacing),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            fillColor: theme.colorScheme.surfaceContainerHighest,
            filled: true,
            isDense: true,
            hint: Text(
              hint,
              style: TextStyle(
                color: Colors.grey,
                fontSize: isMobile ? 12 : 14,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 0,
            ),
          ),
        ),
      ],
    );
  }

  Widget formFieldWithDate(
    String label,
    String hint,
    VoidCallback callBack,
    TextEditingController textController,
  ) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 12 : 14,
          ),
        ),
        TextFormField(
          onTap: callBack,
          controller: textController,
          decoration: InputDecoration(
            fillColor: theme.colorScheme.surfaceContainerHighest,
            filled: true,
            hint: Text(
              hint,
              style: TextStyle(
                color: Colors.grey,
                fontSize: isMobile ? 12 : 14,
              ),
            ),
            isDense: true,
            suffixIcon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 0,
            ),
          ),
        ),
      ],
    );
  }

  Widget frequencyButtons(String text, int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedIndex == index
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surfaceContainerHighest,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
            side: BorderSide(
              width: 1.5,
              color: selectedIndex == index
                  ? Colors.blue.shade900
                  : Colors.grey.shade500,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 12 : 14,
            color: selectedIndex == index ? Colors.blue[900] : Colors.grey,
          ),
        ),
      ),
    );
  }
}
