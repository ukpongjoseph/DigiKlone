import 'package:flutter/material.dart';

class KycIdentityVerificationCard extends StatefulWidget {
  final ThemeData theme;
  final double spacing;
  final bool isMobile;
  final double screenWidth;
  const KycIdentityVerificationCard({
    super.key,
    required this.theme,
    required this.spacing,
    required this.isMobile,
    required this.screenWidth,
  });

  @override
  State<KycIdentityVerificationCard> createState() =>
      _KycIdentityVerificationCardState();
}

class _KycIdentityVerificationCardState
    extends State<KycIdentityVerificationCard> {
  List<String> idType = [
    "Select ID Type",
    "Driver's License",
    "International Passport",
    "NIN (National identity Number)",
    "Voter's Card",
  ];

  String selectedId = "Select ID Type";
  final idNumberController = TextEditingController();
  bool canSubmit = false;
  bool canSubmit1 = false;
  bool isButtonValid = false;

  @override
  void initState() {
    super.initState();
    idNumberController.addListener(() {
      setState(() {
        canSubmit = ((idNumberController.text.length) > 10);
        checkButtonValidity();
      });
    });
  }

  void checkButtonValidity() {
    setState(() {
      isButtonValid = canSubmit && canSubmit1;
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
              backgroundColor: const Color.fromARGB(255, 240, 175, 171),
              child: Icon(Icons.edit_document, color: Colors.red),
            ),
            title: Text(
              "Identity Verification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.isMobile ? 15 : 17,
              ),
            ),
            subtitle: Text(
              "Upload a valid government-issued ID",
              style: TextStyle(fontSize: widget.isMobile ? 11 : 13),
            ),
            trailing: Icon(Icons.info_outline, color: Colors.red),
          ),
          SizedBox(height: widget.spacing),
          Padding(
            padding: EdgeInsets.all(widget.spacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Means of ID Type",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.isMobile ? 13 : 15,
                  ),
                ),
                SizedBox(height: widget.spacing),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: widget.spacing),
                  decoration: BoxDecoration(
                    color: widget.theme.colorScheme.surfaceContainerHighest,
                    border: Border.all(width: 1.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedId,
                      items: idType.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: widget.isMobile ? 12 : 14,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedId = value!;
                          canSubmit1 = (selectedId != "Select ID Type");
                        });
                        checkButtonValidity();
                      },
                    ),
                  ),
                ),
                SizedBox(height: widget.spacing),
                Text(
                  "ID Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.isMobile ? 13 : 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: widget.isMobile ? 13 : 15),
                    controller: idNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 11) {
                        return "Invalid ID Number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: widget.spacing,
                      ),
                      hintText: "Enter your ID number",
                      hintStyle: TextStyle(
                        fontSize: widget.isMobile ? 11 : 13,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: widget.spacing),
                Text(
                  "Upload ID Document",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.isMobile ? 13 : 15,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        widget.theme.colorScheme.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_upload_outlined),
                      Text("Select Document"),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: widget.spacing),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isButtonValid
                          ? const Color.fromARGB(255, 18, 87, 144)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
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
