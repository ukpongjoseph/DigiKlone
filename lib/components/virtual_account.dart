import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// This package allows us to use the Clipboard class to copy data to our system Clipboard
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class VirtualAccount extends StatefulWidget {
  const VirtualAccount({super.key});

  @override
  State<VirtualAccount> createState() => _VirtualAccountState();
}

class _VirtualAccountState extends State<VirtualAccount> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    String acccountNumber = "9876543210";
    // Function to copy data to clipboard. Function takes in a string as per what the widget requires. Function is marked asynchronous to allow other operations go on while waiting for the system clipboard opeartion to complete
    void copyToClipBoard(String textToCopy) async {
      await Clipboard.setData(ClipboardData(text: textToCopy));
    }

    void displayCopiedAccountNumberDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Copied!"),
            content: Text("Virtual account number copied to clipboard"),
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

    void callCopyAndDialogFunction() {
      displayCopiedAccountNumberDialog();
      copyToClipBoard(acccountNumber);
    }

    return Container(
      padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Account Number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 14 : 18,
                    ),
                  ),
                  Text(
                    "Use this account for direct transfers",
                    style: TextStyle(fontSize: isMobile ? 11 : 14.5),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(Icons.apartment_outlined, size: isMobile ? 18 : 23),
              ),
            ],
          ),
          SizedBox(height: spacing * 2.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    acccountNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 14 : 18,
                    ),
                  ),
                  Text(
                    "Providus Bank",
                    style: TextStyle(fontSize: isMobile ? 11 : 14.5),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: IconButton(
                  onPressed: () {
                    callCopyAndDialogFunction();
                  },
                  icon: Icon(Icons.copy, size: isMobile ? 18 : 23),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
