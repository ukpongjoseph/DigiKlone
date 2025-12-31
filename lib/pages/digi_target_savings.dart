import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/digi_target_providers.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/review_digi_target.dart';
import 'package:second_flutter/theme/app_theme.dart';

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

  // Boolean state to handle the toggle switch
  bool isSwitched = true;

  // Boolean to track if all formFields are correctly filled
  bool isProperlyFilled = false;
  void confirmDigiTargetSavings() {
    if (_formkey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewDigitarget()),
      );
    }
  }

  Future<void> selectDate(TextEditingController textController) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        textController.text = DateFormat("dd MMM yyyy").format(selectedDate);
        isProperlyFilled = true;
      });
    }
  }

  // Integer variable to track savings frequency
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
    ThemeData theme = context.read<ThemeProvider>().getTheme();

    void handleSavingsNameTarget(controllerText) {
      context.read<DigiTargetProviders>().setSavingsName(controllerText);
    }

    void handleSavingsAmountTarget(controllerText) {
      context.read<DigiTargetProviders>().setSavingsAmount(controllerText);
    }

    void handleSavingsStartDate(controllerText) {
      context.read<DigiTargetProviders>().setStartDate(controllerText);
    }

    void handleSavingsEndDate(controllerText) {
      context.read<DigiTargetProviders>().setEndDate(controllerText);
    }

    void handleSavingsFrequency(int index) {
      if (index == 0) {
        context.read<DigiTargetProviders>().setSavingsFrequency("Daily");
      } else if (index == 1) {
        context.read<DigiTargetProviders>().setSavingsFrequency("Weekly");
      } else {
        context.read<DigiTargetProviders>().setSavingsFrequency("Monthly");
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
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
                          () {
                            handleSavingsNameTarget(savingsName.text);
                          },
                        ),
                        SizedBox(height: spacing * 2),
                        formFieldWidgetWithoutDate(
                          "Target Amount",
                          "₦10,000",
                          targetAmount,
                          () {
                            handleSavingsAmountTarget(targetAmount.text);
                          },
                        ),
                        SizedBox(height: spacing * 2),
                      ],
                    ),
                    SizedBox(height: spacing * 2),
                    formFieldWithDate(
                      "Start date",
                      "29 Aug 2025",
                      () {
                        selectDate(startDate);
                      },
                      startDate,
                      () {
                        handleSavingsStartDate(startDate.text);
                      },
                    ),
                    SizedBox(height: spacing * 2),
                    formFieldWithDate(
                      "End date",
                      "30 Sep 2025",
                      () {
                        selectDate(endDate);
                      },
                      endDate,
                      () {
                        handleSavingsEndDate(endDate.text);
                      },
                    ),
                    SizedBox(height: spacing * 2),
                    Text(
                      "How often will you save ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        frequencyButtons("Daily", 0, () {
                          handleSavingsFrequency(0);
                        }),
                        SizedBox(width: spacing),
                        frequencyButtons("Weekly", 1, () {
                          handleSavingsFrequency(1);
                        }),
                        SizedBox(width: spacing),
                        frequencyButtons("Monthly", 2, () {
                          handleSavingsFrequency(2);
                        }),
                      ],
                    ),
                    SizedBox(height: spacing * 2),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        border: Border.all(width: 1.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Automate this DigiTarget",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile ? 12 : 14,
                                ),
                              ),
                              Text(
                                "(optional)",
                                style: TextStyle(fontSize: isMobile ? 10 : 12),
                              ),
                            ],
                          ),
                          Switch(
                            value: isSwitched,
                            activeTrackColor: Colors.green,
                            onChanged: (bool value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing * 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _formkey.currentState!.validate()
                ? confirmDigiTargetSavings()
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isProperlyFilled
                  ? Colors.blue[600]
                  : Colors.grey[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Review Target",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 13 : 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget formFieldWidgetWithoutDate(
    String label,
    String hint,
    TextEditingController textController,
    VoidCallback setDigiTargetProviderValues,
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
          style: TextStyle(fontSize: isMobile ? 10 : 12),
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Invalid Value";
            } else {
              setDigiTargetProviderValues();
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget formFieldWithDate(
    String label,
    String hint,
    VoidCallback callBack,
    TextEditingController textController,
    VoidCallback setDigiTargetProviderValues,
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
          readOnly: true,
          style: TextStyle(fontSize: isMobile ? 10 : 12),
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Invalid date";
            } else {
              setDigiTargetProviderValues();
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget frequencyButtons(
    String text,
    int index,
    VoidCallback setDigiTargetSavingsFrequency,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
            setDigiTargetSavingsFrequency();
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: (selectedIndex == index && theme != darkTheme)
              ? Colors.blue[100]
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
