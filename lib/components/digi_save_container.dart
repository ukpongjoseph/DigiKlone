import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/digi_save_balance.dart';

class DigiSaveContainer extends StatefulWidget {
  const DigiSaveContainer({super.key});

  @override
  State<DigiSaveContainer> createState() => _DigiSaveContainerState();
}

class _DigiSaveContainerState extends State<DigiSaveContainer> {
  final formkey = GlobalKey<FormState>();
  final depositController = TextEditingController();

  void confirmDeposit() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Confirm Deposit"),
          content: Text("Add ₦${depositController.text} to your Digisave?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DigiSaveBalance()),
                );
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  void showBottomModal() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        ThemeData theme = context.read<ThemeProvider>().getTheme();
        return Container(
          padding: EdgeInsets.all(10),
          height: (MediaQuery.of(context).size.height) * .5,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How DigiSave Works",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 6,
                      leading: Icon(
                        Icons.watch_later_outlined,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        "3-Month Cycles",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        "Your savings are locked in 3-month cycles. You can withdraw without penalty at the end of each cycle",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 6,
                      leading: Icon(
                        Icons.warning_amber,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        "Early Withdrawal Penalty",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        "Your savings are locked in 3-month cycles. You can withdraw without penalty at the end of each cycle",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 6,
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        size: 20,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Flexible Deposits",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        "Your savings are locked in 3-month cycles. You can withdraw without penalty at the end of each cycle",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void displayQuickSave() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        ThemeData theme = context.read<ThemeProvider>().getTheme();
        return Container(
          padding: EdgeInsets.all(10),
          height: (MediaQuery.of(context).size.height) * .3,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Text(
                "Deposit to DigiSave",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(height: 3),
              Text("Enter amount to deposit", style: TextStyle(fontSize: 10)),
              SizedBox(height: 3),
              Form(
                key: formkey,
                child: TextFormField(
                  controller: depositController,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: "Enter amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1.5, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        confirmDeposit();
                      },
                      child: Text(
                        "Deposit",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void displayWithdrawalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();
        final formKey1 = GlobalKey<FormState>();
        final amountController = TextEditingController();
        final pinController = TextEditingController();
        ThemeData theme = context.read<ThemeProvider>().getTheme();
        String selectedValue = "wallet";

        return StatefulBuilder(
          builder: (BuildContext context, setModalState) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("Withdraw from DigiSave")),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.warning),
                          Text("1.75% penalty for early withdrawal"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: amountController,
                        decoration: InputDecoration(
                          hintText: "Enter amount",
                          hintStyle: TextStyle(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(child: Text("Available balance : ₦45,500")),
                    SizedBox(height: 20),
                    Text("Destination"),
                    DropdownButton(
                      isExpanded: true,
                      value: selectedValue,
                      items: [
                        DropdownMenuItem(
                          value: "wallet",
                          child: Row(
                            children: [
                              Icon(Icons.wallet),
                              SizedBox(width: 8),
                              Text("DigiWallet"),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: "bank",
                          child: Row(
                            children: [
                              Icon(Icons.apartment),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bank Account"),
                                  Text("GTBank - 1234567890"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setModalState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Withdrawal PIN"),
                        Form(
                          key: formKey1,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            controller: pinController,
                            decoration: InputDecoration(
                              hintText: "Enter 4-digit PIN",
                              hintStyle: TextStyle(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: true,
                          onChanged: (value) {},
                          activeColor: Colors.blueGrey,
                        ),
                        Expanded(
                          child: Text(
                            "I accept the terms and conditions of withdrawal penalty",
                            style: TextStyle(fontSize: 9),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Cancel"),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Next"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int cycle = 2;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;

    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(spacing * 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 21, 38, 192),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: spacing * 5),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 97, 90, 242),
                      child: Icon(
                        Icons.savings_outlined,
                        color: Colors.white,
                        size: isMobile ? 30 : 40,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottomModal();
                      },
                      child: CircleAvatar(
                        radius: isMobile ? 13 : 20,
                        backgroundColor: const Color.fromARGB(255, 97, 90, 242),
                        child: Icon(Icons.info_outline, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing),
                Text(
                  "DigiSave Balance",
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: isMobile ? 12 : 14,
                  ),
                ),
                Text(
                  "₦45,000",
                  style: TextStyle(
                    fontSize: isMobile ? 30 : 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: spacing * 2),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 82, 74, 246),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(minimumSize: Size.zero),
                        onPressed: () {},
                        icon: Icon(
                          Icons.trending_up_rounded,
                          color: Colors.green,
                        ),
                        label: Text(
                          "Interest Accrued",
                          style: TextStyle(
                            color: Colors.grey[100],
                            fontSize: isMobile ? 12 : 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "+₦1,250.75",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 16 : 18,
                        ),
                      ),
                      Text(
                        "12.5% p.a.",
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: isMobile ? 10 : 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing * 2),
                Text(
                  "Current Cycle : $cycle of 3",
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: spacing),
                LinearProgressIndicator(
                  value: (cycle / 3),
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: const Color.fromARGB(255, 118, 112, 231),
                ),
                Text(
                  "Next withdrawal: Jan 15, 2025",
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: isMobile ? 10 : 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: spacing * 2),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 21, 38, 192),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      displayQuickSave();
                    },
                    child: Text(
                      "+ Quick Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: spacing * 2),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 192, 21, 21),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      displayWithdrawalSheet();
                    },
                    child: Text(
                      "- Withdraw",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}