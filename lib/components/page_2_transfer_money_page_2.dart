import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/money_transfer_provider.dart';

class Page2TransferMoneyPage2 extends StatefulWidget {
  final Function(bool) boolToBePassed;
  const Page2TransferMoneyPage2({super.key, required this.boolToBePassed});

  @override
  State<Page2TransferMoneyPage2> createState() =>
      _Page2TransferMoneyPage2State();
}

class _Page2TransferMoneyPage2State extends State<Page2TransferMoneyPage2> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  bool canProceed = false;

  List<String> dedicatedAmounts = ["1000", "5000", "10000", "20000"];
  void sendDataToParent() {
    widget.boolToBePassed(canProceed);
  }

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      setState(() {
        canProceed = (amountController.text.isNotEmpty);
        context.read<MoneyTransferProvider>().setTransferAmount(amountController.text);
        sendDataToParent();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Beneficiary Container
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person_2_outlined, color: Colors.blueAccent),
              ),
              title: Text(
                context.read<MoneyTransferProvider>().getBeneficiaryName(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
              subtitle: Text(
                context
                    .read<MoneyTransferProvider>()
                    .getBeneficiaryAccountNumber(),
              ),
            ),
          ),

          // Amount Container
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₦",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: isMobile ? 30 : 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: amountController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 30 : 34,
                      ),
                      onChanged: (value) {
                        context.read<MoneyTransferProvider>().setTransferAmount(
                          value,
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a valid amount";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Text(
                          "0.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 30 : 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description Tab
          Text(
            "Description (Optional)",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing),
            child: Form(
              key: _formKey1,
              child: TextFormField(
                style: TextStyle(fontSize: isMobile ? 13 : 15),
                controller: descriptionController,
                onChanged: (value) {
                  context.read<MoneyTransferProvider>().setTransferDescription(
                    value,
                  );
                },
                decoration: InputDecoration(
                  hintText: "What's this for ?",
                  hintStyle: TextStyle(fontSize: isMobile ? 12 : 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.5, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...dedicatedAmounts.map((e) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      amountController.text = e;
                    },
                    child: Text("₦$e", style: TextStyle(color: Colors.black)),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
