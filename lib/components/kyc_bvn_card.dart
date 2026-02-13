import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KycBvnCard extends StatefulWidget {
  final ThemeData theme1;
  final double spacing;
  final bool isMobile;
  final double screenWidth;
  const KycBvnCard({
    super.key,
    required this.theme1,
    required this.spacing,
    required this.isMobile,
    required this.screenWidth,
  });

  @override
  State<KycBvnCard> createState() => _KycBvnCardState();
}

class _KycBvnCardState extends State<KycBvnCard> {
  final bvnController = TextEditingController();
  bool canSubmit = false;
  bool isSubmitting = false;
  bool isBvnVerified = false;

  @override
  void initState() {
    super.initState();
    bvnController.addListener(() {
      setState(() {
        canSubmit = (bvnController.text.length) == 11;
      });
    });
  }

  void successfulVerification() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Success"),
          content: Text("BVN verified successfully"),
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

  Future<void> submitBVN() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isBvnVerified = true;
      });
    });
  }

  void submit() async {
    setState(() {
      isSubmitting = true;
    });
    await submitBVN();
    successfulVerification();
    bvnController.text = "";
    setState(() {
      isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: widget.spacing * 2),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            minTileHeight: widget.spacing,
            contentPadding: EdgeInsets.all(widget.spacing),
            minVerticalPadding: widget.spacing,
            leading: CircleAvatar(
              backgroundColor: isBvnVerified
                  ? const Color.fromARGB(255, 171, 240, 172)
                  : const Color.fromARGB(255, 240, 175, 171),
              child: Icon(
                Icons.shield_outlined,
                color: isBvnVerified ? Colors.green : Colors.red,
              ),
            ),
            title: Text(
              "BVN Verification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.isMobile ? 15 : 17,
              ),
            ),
            subtitle: Text(
              "Verify your Bank Verification Number",
              style: TextStyle(fontSize: widget.isMobile ? 11 : 13),
            ),
            trailing: Icon(
              isBvnVerified ? Icons.check_circle_outline : Icons.info_outline,
              color: isBvnVerified ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: widget.spacing),
          isBvnVerified
              ? Container(
                  padding: EdgeInsets.all(widget.spacing),
                  color: const Color.fromARGB(255, 160, 225, 162),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.green),
                      Text(
                        "Verified Successfully",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: widget.isMobile ? 11 : 13,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(widget.spacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bank Verification Number (BVN)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: widget.spacing),
                        child: TextFormField(
                          style: TextStyle(fontSize: widget.isMobile ? 13 : 15),
                          controller: bvnController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 11) {
                              return "Invalid BVN";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Enter your 11-digit BVN",
                            hintStyle: TextStyle(
                              fontSize: widget.isMobile ? 11 : 13,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.5,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Your BVN is safe and secure with us. We use bank-level security.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: widget.isMobile ? 10 : 12,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: widget.spacing),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: canSubmit
                                ? Colors.blue.shade900
                                : Colors.grey.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            canSubmit ? submit() : null;
                          },
                          child: Text(
                            isSubmitting ? "Verifying..." : "Verify",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
