import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/pages/support.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final dobController = TextEditingController();
  final houseAddressController = TextEditingController();
  final additionalAddressController = TextEditingController();
  bool isSaving = false;

  List<String> listOfGenders = [
    "",
    "Male",
    "Female",
    "Others",
    "Prefer not to say",
  ];
  List<String> listOfMarritalStatus = [
    "",
    "Single",
    "Married",
    "Divorced",
    "Widowed",
    "Seperated",
  ];
  List<String> listOfEmploymentStatus = [
    "",
    "Employed",
    "Self-employed",
    "Unemployed",
    "Student",
    "Retired",
    "Other",
  ];
  List<String> listOfStates = [
    "",
    "Abia",
    "Akwa-Ibom",
    "Delta",
    "Ebonyi",
    "Plateau",
    "Oyo",
  ];
  String selectedGender = "";
  String selectedMaritalStatus = "";
  String selectedEmploymentStatus = "";
  String selectedState = "";
  Future<void> displayDatePicker(TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1940),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        controller.text = DateFormat("dd/MM/yyyy").format(selectedDate);
      });
    }
  }

  void saveChanges() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Success"),
          content: Text("Profile updated successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LandingPage(),
                  ),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> delayTimerForSaveButton() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isSaving = false;
      });
      saveChanges();
    });
  }

  void submit() async {
    await delayTimerForSaveButton();
    saveChanges();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: spacing),
            child: IconButton(
              onPressed: () {
                showDialog(
                  // barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text("Success"),
                      content: Text("Profile updated successfully!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LandingPage(),
                              ),
                            );
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: spacing * 2),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: isMobile ? 35 : 40,
                          child: Image.asset("assets/images/avatar.png"),
                        ),
                        CircleAvatar(
                          radius: isMobile ? 14 : 16,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: isMobile ? 14 : 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text("Tap to change photo", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              SizedBox(height: spacing * 3),
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacing * 2),
                child: Text(
                  "My profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 16 : 18,
                  ),
                ),
              ),
              readOnlyWidget("First Name", "John"),
              readOnlyWidget("Last Name", "Doe"),
              readOnlyWidget("Email Address", "john.doe@example.com"),
              readOnlyWidget("Phone Number", "+234 808 123 4567"),
              Row(
                children: [
                  Text(
                    "To change your account details, please ",
                    style: TextStyle(fontSize: isMobile ? 10 : 12),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Support()),
                      );
                    },
                    child: Text(
                      "contact support",
                      style: TextStyle(
                        fontSize: isMobile ? 10 : 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Date of Birth",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacing),
                child: TextFormField(
                  controller: dobController,
                  onTap: () {
                    displayDatePicker(dobController);
                  },
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month),
                    suffixIcon: Icon(Icons.chevron_right_outlined),
                    hintStyle: TextStyle(fontSize: isMobile ? 13 : 15),
                    hintText: "Select your date of birth",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      gapPadding: 2.0,
                    ),
                  ),
                ),
              ),
              withDropDown("Gender", listOfGenders, selectedGender, (value) {
                setState(() {
                  selectedGender = value;
                });
              }),
              withDropDown(
                "Marital Status",
                listOfMarritalStatus,
                selectedMaritalStatus,
                (value) {
                  setState(() {
                    selectedMaritalStatus = value;
                  });
                },
              ),
              withDropDown(
                "Employment Status",
                listOfEmploymentStatus,
                selectedEmploymentStatus,
                (value) {
                  setState(() {
                    selectedEmploymentStatus = value;
                  });
                },
              ),
              SizedBox(height: spacing * 5),
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacing),
                child: Text(
                  "Location Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 16 : 18,
                  ),
                ),
              ),
              withDropDown("State of Residence", listOfStates, selectedState, (
                value,
              ) {
                setState(() {
                  selectedState = value;
                });
              }),
              addressWidgets(
                "House Address",
                "Enter your house address",
                houseAddressController,
              ),
              addressWidgets(
                "Additional Address",
                "Enter additional address information",
                additionalAddressController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(spacing * 3),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            setState(() {
              isSaving = true;
            });
            submit();
          },
          child: Text(
            isSaving ? "Saving ..." : "Save Changes",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget readOnlyWidget(String title, String controller) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
          SizedBox(height: spacing),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: isMobile ? 13 : 15),
              hintText: controller,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                gapPadding: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget withDropDown(
    String title,
    List<String> list,
    String initValue,
    ValueChanged<String> callback,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
          SizedBox(height: spacing),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(spacing * 2),
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                style: TextStyle(fontSize: isMobile ? 13 : 15),
                isDense: true,
                isExpanded: true,
                value: initValue,
                items: list.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  callback(value!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressWidgets(
    String title,
    String hintText,
    TextEditingController controller,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
          SizedBox(height: spacing * 2),
          TextFormField(
            style: TextStyle(fontSize: isMobile ? 13 : 15),
            validator: (value) {
              if (value != null || value!.isEmpty) {
                return "Invalid !!!";
              }
              return null;
            },
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: isMobile ? 13 : 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1.5, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
