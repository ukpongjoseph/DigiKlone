import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/money_transfer_provider.dart';
import 'package:second_flutter/pages/transferMoney/transfer_money_2.dart';
// import 'package:second_flutter/a_List_providers/theme_provider.dart';

class AccountNumberAndSavedRecipient extends StatefulWidget {
  const AccountNumberAndSavedRecipient({super.key});

  @override
  State<AccountNumberAndSavedRecipient> createState() =>
      _AccountNumberAndSavedRecipientState();
}

class _AccountNumberAndSavedRecipientState
    extends State<AccountNumberAndSavedRecipient> {
  List<Map<String, dynamic>> beneficiaries = [
    {
      "acctName": "Sarah Johnson",
      "acctNumber": "2234567890",
      "isFavorite": true,
    },
    {
      "acctName": "Michael Chen",
      "acctNumber": "2234567891",
      "isFavorite": false,
    },
    {
      "acctName": "Emma Williams",
      "acctNumber": "2234567892",
      "isFavorite": true,
    },
    {
      "acctName": "David Brown",
      "acctNumber": "2234567893",
      "isFavorite": false,
    },
    {"acctName": "Lisa Davis", "acctNumber": "2234567894", "isFavorite": true},
    {
      "acctName": "Odekeye Precious",
      "acctNumber": "2234567895",
      "isFavorite": false,
    },
  ];
  final _formKey = GlobalKey<FormState>();
  final acctNumberController = TextEditingController();
  bool isButtonEnabled = false;
  bool isBeneficiarySelected = false;

  @override
  void initState() {
    super.initState();
    acctNumberController.addListener(() {
      setState(() {
        isButtonEnabled = acctNumberController.text.length == 10;
        isBeneficiarySelected = acctNumberController.text.length == 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "DigiKolo Account Number",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
          SizedBox(height: spacing),
          Form(
            key: _formKey,
            child: TextFormField(
              style: TextStyle(fontSize: 13),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a 10-digit account number";
                }
                return null;
              },
              onChanged: (value) {
                if ((value.length) == 10) {
                  setState(() {
                    isButtonEnabled = true;
                  });
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              controller: acctNumberController,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: "Enter 10-digit account number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1.5, color: Colors.grey),
                ),
              ),
            ),
          ),
          isBeneficiarySelected
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing * 3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        child: Icon(
                          Icons.person_2_outlined,
                          color: Colors.blueAccent,
                        ),
                      ),
                      title: Text(
                        context
                            .read<MoneyTransferProvider>()
                            .getBeneficiaryName(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        context
                            .read<MoneyTransferProvider>()
                            .getBeneficiaryAccountNumber(),
                      ),
                      trailing: Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "Saved Recipients",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          CarouselSlider(
            items: [
              ...beneficiaries.map((e) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isBeneficiarySelected = true;
                      context.read<MoneyTransferProvider>().setAllInstanceData(
                        e["acctName"],
                        e["acctNumber"],
                        e["isFavorite"],
                      );
                      acctNumberController.text = context
                          .read<MoneyTransferProvider>()
                          .getBeneficiaryAccountNumber();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: spacing),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(spacing * 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade100,
                          radius: isMobile ? 15 : 17,
                          child: e["isFavorite"] == true
                              ? Icon(
                                  Icons.star_border_outlined,
                                  size: isMobile ? 20 : 24,
                                  color: Colors.amber,
                                )
                              : Icon(
                                  Icons.person_2_outlined,
                                  size: isMobile ? 20 : 24,
                                  color: Colors.blueAccent,
                                ),
                        ),
                        Text(
                          e["acctName"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 12 : 14,
                          ),
                        ),
                        SizedBox(height: spacing / 2),
                        Text(
                          e["acctNumber"],
                          style: TextStyle(fontSize: isMobile ? 10 : 12),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
            options: CarouselOptions(
              padEnds: false,
              height: isMobile ? 120 : 130,
              viewportFraction: isMobile ? 0.4 : 0.2,
              enableInfiniteScroll: false,
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: spacing * 3),
            child: Text(
              "Recent Transfers",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              ...beneficiaries.take(3).map((e) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isBeneficiarySelected = true;
                      context.read<MoneyTransferProvider>().setAllInstanceData(
                        e["acctName"],
                        e["acctNumber"],
                        e["isFavorite"],
                      );
                      acctNumberController.text = context
                          .read<MoneyTransferProvider>()
                          .getBeneficiaryAccountNumber();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: spacing),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      dense: true,
                      minTileHeight: 10,
                      minLeadingWidth: spacing,
                      minVerticalPadding: spacing * 2,
                      leading: Icon(Icons.more_time_sharp),
                      title: Text(
                        e["acctName"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(e["acctNumber"]),
                      trailing: Icon(
                        Icons.arrow_forward,
                        size: isMobile ? 15 : 17,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacing * 3),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  isButtonEnabled
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferMoney2(),
                          ),
                        )
                      : null;
                },
                child: Text("Continue", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
